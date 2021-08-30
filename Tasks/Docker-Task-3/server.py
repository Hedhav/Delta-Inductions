import socket
import os
import math
# import sys
from Crypto.Cipher import AES
import base64
import threading
from Crypto import Random
import json
from pathlib import Path

# make key 32 (256 bits) and iv 16
key = b"This is a key123This is a key123"
# iv = "asdfghjkasdfghjk"
# aes = AES.new(key, AES.MODE_CBC, iv)
SERVER_HOST = "0.0.0.0"
SERVER_PORT = 5019
BUFFER_SIZE = 1024
SEPARATOR = "<  >"

ThreadCount = 0

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.bind((SERVER_HOST, SERVER_PORT))
s.listen(5)
print(f"[*]<><><> Listening as {SERVER_HOST}:{SERVER_PORT}")

# <>

# /home/Documents/delta/fileserver/filestorage

def recvaction(client_socket, address):

    encpassword = client_socket.recv(1024).decode()
    inputtedpassword = base64.b64decode(encpassword).decode()
            

    if inputtedpassword == 'SysAd Rocks':
        DOMAIN = "sysAd"
        client_socket.sendall(f"<><><> Welcome to the server, {DOMAIN} member!".encode())
        print (f"<><><>  {address} : {DOMAIN} member")
    elif inputtedpassword == 'AppDev Rules':
        DOMAIN = "appDev"
        client_socket.sendall(f"<><><> Welcome to the server, {DOMAIN} member!".encode())
        print (f"<><><>  {address} : {DOMAIN} member")
    elif inputtedpassword == 'WebDev over all':
        DOMAIN = "webDev"
        client_socket.sendall(f"<><><> Welcome to the server, {DOMAIN} member!".encode())
        print (f"<><><>  {address} : {DOMAIN} member")

    else:
        client_socket.sendall(f"<><><> Incorrect password;  Exiting".encode())
        print(f"<><><>  {address} :Incorrect password;  Exiting")
        client_socket.close()
        return None


    while True:
        order = (client_socket.recv(1024)).decode()
        # print(f" {address} : {order}")
        if not order:
            client_socket.close()
            return None
        if order == 'DL':
            print (f"<> {address} wants to download a file")
            File_download(client_socket, address, DOMAIN)
        elif order == 'UL':
            print (f"<> {address} wants to upload a file")
            File_upload(client_socket, address, DOMAIN)
        elif order == 'Search':
            print (f"<> {address} wants to perform search")
            File_search(client_socket, address, DOMAIN)
        elif order == 'List':
            print (f"<> {address} wants to view the file list")
            File_list(client_socket, address, DOMAIN)
        elif order == 'Logout':
            print (f"<> {address} is logging out")
            # client_socket.close() 
        elif order == 'Delete':
            print (f"<> {address} wants to Delete a file")
            File_delete(client_socket, address, DOMAIN)
        else:
            print (f"<> {address} has  entered an invalid order - {order}")


def File_upload(client_socket, address, DOMAIN):
    client_socket.send("infodump".encode())

    received = client_socket.recv(BUFFER_SIZE).decode()
    filename, filesize = received.split(SEPARATOR)
    filename = os.path.basename(filename)
    
    print(f"{filename}{SEPARATOR}{filesize}")

    iv = Random.new().read(AES.block_size)
    # print(f"<> {iv} is iv.")
    aes = AES.new(key, AES.MODE_CBC, iv)
    
    data = base64.b64encode(iv)
    client_socket.send(data)

    with open(Path(f"filestorage/{filename}"), "wb") as f:

        fsz = int(filesize)
        loops = fsz/BUFFER_SIZE

        
        loops = math.ceil(loops)

        for i in range(loops):
            bytes_read = client_socket.recv(BUFFER_SIZE)
            # if bytes_read == b"done":
            #     break
            originalData = aes.decrypt(bytes_read)
            # print(f"<> originalData received- {originalData} .")
            ndec = len(originalData)
            if fsz >= ndec:
                f.write(originalData)
            else:
                f.write(originalData[:fsz]) # <- remove padding on last block
            fsz -= ndec
    print(f"<><> {address} : file received- {filesize} bytes,  for {DOMAIN}")

    client_socket.send("infodump".encode())



    
    gid = -1

    import grp
    for g in grp.getgrall():
        if g[0] == f"{DOMAIN}":
            gid = g[2]
            break
    os.chown(Path(f"filestorage/{filename}"), -1, gid)


def File_download(client_socket, address, DOMAIN):  

    client_socket.send("infodump".encode())

    # print('#')

    filename = (client_socket.recv(1024)).decode()
    print(f" {address} : {filename} is filename.")
    SERVER_PATH = "/home/Documents/delta/fileserver"
    filepath = Path(f"{SERVER_PATH}/filestorage/{filename}")
    print(f" {address} : {filepath} is filepath.")
    


    if (os.path.isfile(filepath) and filepath.group() == f"{DOMAIN}"):

        client_socket.send("file exists".encode())
        # print('#') 
        infodump = client_socket.recv(16)

        filesize = os.path.getsize(Path(f"filestorage/{filename}"))
        client_socket.send(f"{filesize}".encode())
        print(f"<> {address} : {filename} - {filesize} bytes being downloaded")
 
        infodump = client_socket.recv(16)

        iv = Random.new().read(AES.block_size)
        # print(f"<> {iv} is iv.")
        aes = AES.new(key, AES.MODE_CBC, iv)
        
        data = base64.b64encode(iv)
        client_socket.send(data)      



        # print(f"{filename} - {filesize} bytes.")
        # print('#') 
        infodump = client_socket.recv(16)
        print(f"<> {address} : {SERVER_PATH}/filestorage/{filename} is filename to be sent") 

        with open(Path(f"filestorage/{filename}"), "rb") as f:
            while True:
                bytes_read = f.read(BUFFER_SIZE)
                n = len(bytes_read)
                if n == 0:
                    # print(f"Breaking.")
                    break
                elif n % 16 != 0:
                    bytes_read += b' ' * (16 - n % 16) # <- padded with spaces

                encryptedData = aes.encrypt(bytes_read)

                client_socket.sendall(encryptedData)
                # print('+', end='')
        print('#')  
        # client_socket.sendall(b"done") 
        print(f"<><> {address} : file sent {filename}- {filesize} bytes.")

        # client_socket.send(f"{filename} has been sent".encode())
    else:
        print(f"<><> {address} : {SERVER_PATH}/filestorage/{filename} does not exist for {DOMAIN}")
        client_socket.send(f"{filename} does not exist for {DOMAIN}".encode())


    
    # client_socket.close()


def File_list(client_socket, address, DOMAIN):      
    # compare file group and domain
    listdir = os.listdir(Path("/home/Documents/delta/fileserver/filestorage"))
    domfiles = []
    for i in range(len(listdir)):
        #print(f"checking- {listdir[i-1]}")
        filepath = Path(f"filestorage/{listdir[i-1]}")
        if filepath.group() == f"{DOMAIN}":
            domfiles.append(listdir[i-1])
            #print(f"sending {listdir[i-1]}")

    domfiles = json.dumps(domfiles)
    client_socket.sendall(domfiles.encode())
    
    print(f"<><> {address} : File List for {DOMAIN} sent")

        
    # for i in range(len(listdir)):
    #     print(listdir[i-1])


def File_delete(client_socket, address, DOMAIN):    

    client_socket.send("infodump".encode())
    # print('#')

    filename = (client_socket.recv(1024)).decode()
    SERVER_PATH = "/home/Documents/delta/fileserver"
    filepath = Path(f"{SERVER_PATH}/filestorage/{filename}")

    if (os.path.isfile(filepath) and filepath.group() == f"{DOMAIN}"):
        print(f"<> {address} : {SERVER_PATH}/filestorage/{filename} is filename to be deleted for {DOMAIN}")   

        
        os.system(f"rm {SERVER_PATH}/filestorage/{filename}")

        print(f"<><> {address} : {SERVER_PATH}/filestorage/{filename} has been deleted for {DOMAIN}")
        client_socket.send(f"{filename} has been deleted".encode())
    else:
        print(f"<><> {address} : {SERVER_PATH}/filestorage/{filename} does not exist for {DOMAIN}")
        client_socket.send(f"{filename} does not exist for {DOMAIN}".encode())


def File_search(client_socket, address, DOMAIN): 

    import re

    client_socket.send("infodump".encode())
    received = client_socket.recv(BUFFER_SIZE).decode()
    filename, pattern1 = received.split(SEPARATOR)
    filename = os.path.basename(filename)

    pattern = re.compile(pattern1)
    print(f"pattern1- {pattern1}//filename- {filename}//pattern- {pattern}")
      

    if filename == "all":
        listdir = os.listdir(Path("/home/Documents/delta/fileserver/filestorage"))
        for i in range(len(listdir)):
            #print(f"checking- {listdir[i-1]}")
            filepath = Path(f"filestorage/{listdir[i-1]}")
            # print(f"checking {filepath}")
            if filepath.group() == f"{DOMAIN}":
                # print(f"sysad- {filepath}")
                for j, line in enumerate(open(filepath)): 
                    for match in re.finditer(pattern, line): 
                        client_socket.send(f"Found {match.group()}: on line {j+1} of {listdir[i-1]}".encode())
                        infodump = client_socket.recv(16)
                        # print ('Found on line %s: %s in %s' % (j+1, match.group(), listdir[i-1]))



        client_socket.send(b"done")   
    else:
        SERVER_PATH = os.getcwd()
        filepath = Path(f"{SERVER_PATH}/filestorage/{filename}")

        if (os.path.isfile(filepath) and filepath.group() == f"{DOMAIN}"):
            for j, line in enumerate(open(filepath)): 

                for match in re.finditer(pattern, line): 
                    client_socket.send(f"Found {match.group()}: on line {j+1} of {filename}".encode())
                    infodump = client_socket.recv(16)
                    # print ('Found on line %s: %s in %s' % (j+1, match.group(), filename))
            client_socket.send(b"done")

        else:
            client_socket.send(f"{filename} does not exist".encode())




    print(f"<><> {address} : sent search results for {filename} - {DOMAIN}")

    
while True:
    client_socket, address = s.accept()
    print('<><><><> Connected to: ' + address[0] + ':' + str(address[1]))
    t = threading.Thread(target=recvaction, args=(client_socket, address))
    t.start()
    ThreadCount += 1
    print('Thread Number: ' + str(ThreadCount))


s.close()

