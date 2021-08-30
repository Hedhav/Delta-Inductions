import socket
import os
from Crypto.Cipher import AES
import base64
import json, getpass
import math


key = b"This is a key123This is a key123"
# iv = "asdfghjkasdfghjk"
# aes = AES.new(key, AES.MODE_CBC, iv)

SEPARATOR = "<  >"
BUFFER_SIZE = 1024 # send 4096 bytes each time step

host = "127.0.0.1"
port = 5019


s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

print(host)

print(f"<><> Connecting to {host}:{port}")
s.connect((host, port))
print("<><> Connected.")


inputtedpassword = getpass.getpass()
encpassword = base64.b64encode(f"{inputtedpassword}".encode())
s.send(encpassword)

status = s.recv(64).decode()
print(f"{status}")

if status == '<><><> Incorrect password;  Exiting':
    s.close()
    exit()  


def File_upload(s):
    infodump = s.recv(16)
    filename = input ("Please select file to upload: ")
    

    filesize = os.path.getsize(filename)
    s.send(f"{filename}{SEPARATOR}{filesize}".encode())
    # print(f"{filename} - {filesize} bytes.")

    data = s.recv(1024)
    iv = base64.b64decode(data)
  
    # print(f"<> {iv} is iv.")
    aes = AES.new(key, AES.MODE_CBC, iv)

    # print(f"{filename} - {filesize} bytes.")
    with open(filename, "rb") as f:
        while True:
            bytes_read = f.read(BUFFER_SIZE)
            n = len(bytes_read)
            if n == 0:
                break
            elif n % 16 != 0:
                bytes_read += b' ' * (16 - n % 16) # <- padded with spaces

            encryptedData = aes.encrypt(bytes_read)
            s.sendall(encryptedData)
            # print(f"<> SENT 1024 bytes (except for last package)")
    # s.sendall(b"done") 
    print(f"file sent- {filesize} bytes.")
    infodump = s.recv(16)


def File_download(s):
    infodump = s.recv(16)
    filename = input ("<> Please enter filename: ")
    filename = os.path.basename(filename)
    s.send(bytes(f"{filename}", "UTF-8"))
    
    status = s.recv(128).decode() 
    # print(status)

    if status == "file exists":
        s.send("infodump".encode())
        filesize = s.recv(BUFFER_SIZE).decode()

        # filesize = int(filesize)

        print(f"{filename}{SEPARATOR}{filesize}")

        s.send("infodump".encode())
        data = s.recv(1024)
        iv = base64.b64decode(data)
        # print(f"<> {iv} is iv.")
        aes = AES.new(key, AES.MODE_CBC, iv)

        s.send("infodump".encode())
        # print(f"{filename} - {filesize} bytes.")
        


        with open(filename, "wb") as f:
            fsz = int(filesize)
            loops = fsz/BUFFER_SIZE

        
            loops = math.ceil(loops)

            for i in range(loops):
            # while True:
                bytes_read = s.recv(BUFFER_SIZE)
                # if bytes_read == b"done":
                #     break

                originalData = aes.decrypt(bytes_read)

                ndec = len(originalData)
                if fsz >= ndec:
                    f.write(originalData)
                else:
                    f.write(originalData[:fsz]) # <- remove padding on last block
                fsz -= ndec
                # print(f"<> GOT 1024 bytes (except for last package)")
        print(f"file received- {filesize} bytes.")
            # s.close()

    else:
        print(status)
        return None
        

def File_list(s):
    data = s.recv(2048)
    data = json.loads(data.decode())
    print ("[] List of Files:")
    for i in range(len(data)):
        print(f"- {data[i-1]}")


def File_delete(s):
    # print('#')
    infodump = s.recv(16) 
    filename = input ("<> Please enter filename: ")
    filename = os.path.basename(filename)
    s.send(bytes(f"{filename}", "UTF-8"))

    status = (s.recv(64)).decode()
    print(status)


def File_search(s):
    infodump = s.recv(16)

    # pattern = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
    filename = input ("Please select file to search (or all): ")
    pattern = input ("Please input pattern: ")


    s.send(f"{filename}{SEPARATOR}{pattern}".encode())

    while True:
        found = s.recv(128).decode()
        if (found == "done"):
            break
        if found == f"{filename} does not exist":
            print(found)
            break
        print(found)
        s.send("infodump".encode())


while True:
    order = input ("<> Please select action- DL, UL, Search, List, Delete, Logout: ")
    # s.send(bytes(f"{order}", "UTF-8"))
    if order == "DL":
        s.send(bytes(f"{order}", "UTF-8"))
        File_download(s)
    elif order == 'UL':
        s.send(bytes(f"{order}", "UTF-8"))
        File_upload(s)
    elif order == 'Search':
        s.send(bytes(f"{order}", "UTF-8"))
        File_search(s)
    elif order == 'List':
        s.send(bytes(f"{order}", "UTF-8"))
        File_list(s)
    elif order == 'Logout':
        s.send(bytes(f"{order}", "UTF-8"))
        print ("<> Logging Out")
        break
        # exit()
    elif order == 'Delete':
        s.send(bytes(f"{order}", "UTF-8"))
        File_delete(s)
    else:
        print (f"<> Please enter a valid order not {order}")


print ("<><> closing socket")
s.close()
