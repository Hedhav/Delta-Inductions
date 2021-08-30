import array as arr
import sys
import ctypes


SHA384_512_BLOCK_SIZE = int( 1024 / 8)
DIGEST_SIZE = int( 384 / 8)

sha512_k = arr.array('L',[0x428a2f98d728ae22, 0x7137449123ef65cd,
             0xb5c0fbcfec4d3b2f, 0xe9b5dba58189dbbc,
             0x3956c25bf348b538, 0x59f111f1b605d019,
             0x923f82a4af194f9b, 0xab1c5ed5da6d8118,
             0xd807aa98a3030242, 0x12835b0145706fbe,
             0x243185be4ee4b28c, 0x550c7dc3d5ffb4e2,
             0x72be5d74f27b896f, 0x80deb1fe3b1696b1,
             0x9bdc06a725c71235, 0xc19bf174cf692694,
             0xe49b69c19ef14ad2, 0xefbe4786384f25e3,
             0x0fc19dc68b8cd5b5, 0x240ca1cc77ac9c65,
             0x2de92c6f592b0275, 0x4a7484aa6ea6e483,
             0x5cb0a9dcbd41fbd4, 0x76f988da831153b5,
             0x983e5152ee66dfab, 0xa831c66d2db43210,
             0xb00327c898fb213f, 0xbf597fc7beef0ee4,
             0xc6e00bf33da88fc2, 0xd5a79147930aa725,
             0x06ca6351e003826f, 0x142929670a0e6e70,
             0x27b70a8546d22ffc, 0x2e1b21385c26c926,
             0x4d2c6dfc5ac42aed, 0x53380d139d95b3df,
             0x650a73548baf63de, 0x766a0abb3c77b2a8,
             0x81c2c92e47edaee6, 0x92722c851482353b,
             0xa2bfe8a14cf10364, 0xa81a664bbc423001,
             0xc24b8b70d0f89791, 0xc76c51a30654be30,
             0xd192e819d6ef5218, 0xd69906245565a910,
             0xf40e35855771202a, 0x106aa07032bbd1b8,
             0x19a4c116b8d2d0c8, 0x1e376c085141ab53,
             0x2748774cdf8eeb99, 0x34b0bcb5e19b48a8,
             0x391c0cb3c5c95a63, 0x4ed8aa4ae3418acb,
             0x5b9cca4f7763e373, 0x682e6ff3d6b2b8a3,
             0x748f82ee5defb2fc, 0x78a5636f43172f60,
             0x84c87814a1f0ab72, 0x8cc702081a6439ec,
             0x90befffa23631e28, 0xa4506cebde82bde9,
             0xbef9a3f7b2c67915, 0xc67178f2e372532b,
             0xca273eceea26619c, 0xd186b8c721c0c207,
             0xeada7dd6cde0eb1e, 0xf57d4f7fee6ed178,
             0x06f067aa72176fba, 0x0a637dc5a2c898a6,
             0x113f9804bef90dae, 0x1b710b35131c471b,
             0x28db77f523047d84, 0x32caab7b40c72493,
             0x3c9ebe0a15c9bebc, 0x431d67c49c100d4c,
             0x4cc5d4becb3e42b6, 0x597f299cfc657e2a,
             0x5fcb6fab3ad6faec, 0x6c44198c4a475817])
 
# unsigned char m_block[2 * SHA384_512_BLOCK_SIZE]
m_block = ""
# m_block = arr.array('c',[])
m_h = arr.array('L',[0xcbbb9d5dc1059ed8, 0x629a292a367cd507, 
        0x9159015a3070dd17, 0x152fecd8f70e5939, 0x67332667ffc00b31, 
        0x8eb44a8768581511, 0xdb0c2e0d64f98fa7, 0x47b5481dbefa4fa4])

m_len = int(0)
m_tot_len = int(0)




def SHA2_SHFR(x, n):    
    return (x >> n)
def SHA2_ROTR(x, n):   
    return ((x >> n) | (x << ((sys.getsizeof(x) << 3) - n)))
def SHA2_ROTL(x, n):   
    return ((x << n) | (x >> ((sys.getsizeof(x) << 3) - n)))
def SHA2_CH(x, y, z):  
    return ((x & y) ^ (~x & z))
def SHA2_MAJ(x, y, z): 
    return ((x & y) ^ (x & z) ^ (y & z))
def SHA512_F1(x): 
    return (SHA2_ROTR(x, 28) ^ SHA2_ROTR(x, 34) ^ SHA2_ROTR(x, 39))
def SHA512_F2(x): 
    return (SHA2_ROTR(x, 14) ^ SHA2_ROTR(x, 18) ^ SHA2_ROTR(x, 41))
def SHA512_F3(x): 
    return (SHA2_ROTR(x,  1) ^ SHA2_ROTR(x,  8) ^ SHA2_SHFR(x,  7))
def SHA512_F4(x): 
    return (SHA2_ROTR(x, 19) ^ SHA2_ROTR(x, 61) ^ SHA2_SHFR(x,  6))

def SHA2_UNPACK32(x, str):                
    s = list(f"{str}")
    s[3] = ((x)      )       
    s[2] = ((x) >>  8);       
    s[1] = ((x) >> 16);       
    s[0] = ((x) >> 24); 
    str = "".join(s)      

def SHA2_UNPACK64(x, str):
    s = list(f"{str}")                                            
    s[7] = ((x)      )       
    s[6] = ((x) >>  8)       
    s[5] = ((x) >> 16)       
    s[4] = ((x) >> 24)       
    s[3] = ((x) >> 32)       
    s[2] = ((x) >> 40)       
    s[1] = ((x) >> 48)       
    s[0] = ((x) >> 56)
    str = "".join(s)        

def SHA2_PACK64(str, x):                 
    # s = list(f"{str}")                                             
    x =    str[7] | str[6] <<  8 | str[5] << 16 | str[4] << 24 | str[3] << 32 | str[2] << 40| str[1] << 48 | str[0] << 56  
    # str = "".join(s)   


 
def transform1(message, block_nb):


    w = arr.array('L',[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]) #80
    wv = arr.array('L',[0,0,0,0,0,0,0,0]) #8
    
    sub_block = ""
    
    for i in range(0, block_nb):
        # print(i)
        # Convert to lists?????
        sub_block = message + str((i << 7))
        for j in range(0, 16):
            # print((j << 3)+ 2**32)
            # print(w[2])

#            ### UNCOMMENT SHA2_PACK64(sub_block[ctypes.c_ulong(j << 3).value], w[j])
            # SHA2_PACK64(sub_block[(j << 3)+ 2**32], w[j])
            pass
            
        for j in range(16, 80):
            w[j] =  SHA512_F4(w[j -  2]) + w[j -  7] + SHA512_F3(w[j - 15]) + w[j - 16]
        for j in range(0, 8): 
            wv[j] = m_h[j]
        
        for j in range(0, 80):

            try:
                
                t1 = wv[7] + SHA512_F2(wv[4]) + SHA2_CH(wv[4], wv[5], wv[6]) + sha512_k[j] + w[j]
                t2 = SHA512_F1(wv[0]) + SHA2_MAJ(wv[0], wv[1], wv[2])
                wv[7] = wv[6]
                wv[6] = wv[5]
                wv[5] = wv[4]
                wv[4] = wv[3] + t1
                wv[3] = wv[2]
                wv[2] = wv[1]
                wv[1] = wv[0]
                wv[0] = t1 + t2
            except OverflowError:
                wv[4] = wv[3] + t1
                wv[3] = wv[2]
                wv[2] = wv[1]
                wv[1] = wv[0]
                wv[0] = t1 + t2
            # except OverflowError as of:
            #     wv[0] = t1 + t2                
                # wv[4] = wv[3] + t1
                
        for j in range(0, 8):
            m_h[j] += wv[j]
            


##MEMCOPY
def update1(message, len, m_len, m_tot_len):
    m_len = int(m_len)
    m_tot_len = int(m_tot_len)
    shifted_message = ""
    tmp_len = int(SHA384_512_BLOCK_SIZE - m_len)


    rem_len = len if (len < tmp_len) else tmp_len

    # memcpy(&m_block[m_len], message, rem_len) ##MEMCOPY - PROBLEMs


    # like C's memcpy(buf+i, foo, 2)
#    ###UNCOMMENT m_block[m_len:m_len+rem_len] = message

    if ((m_len + len) < SHA384_512_BLOCK_SIZE):
        m_len += len
        return
    
    new_len = int(len - rem_len)
    block_nb = int(new_len / SHA384_512_BLOCK_SIZE)  #block number
    shifted_message = message + rem_len
    transform1(m_block, 1)
    transform1(shifted_message, block_nb)
    rem_len = int(new_len % SHA384_512_BLOCK_SIZE)
    # memcpy(m_block, &shifted_message[block_nb << 7], rem_len) ##MEMCOPY - PROBLEMs
#    ###UNCOMMENT m_block[0:rem_len] = shifted_message[block_nb << 7]
    m_len = int(rem_len)
    m_tot_len += ((block_nb + 1) << 7)


##MEMSET - PROBLEMs
def final1(digest):

    
    block_nb = int(1 + ((SHA384_512_BLOCK_SIZE - 17)
                     < (m_len % SHA384_512_BLOCK_SIZE)))
    len_b = int((m_tot_len + m_len) << 3)
    pm_len = int(block_nb << 7)
    # buffer[:] = bytearray(size)
    # hex(id(x))
    fillchar = str(0)
    ###+ m_len
    data = ctypes.POINTER(ctypes.c_char)()
    
    # ctypes.memset(((ctypes.addressof(m_block))), str(0), pm_len - m_len)
    ###UNCOMMENT m_block[m_len] = 0x80
    
          
#    ###UNCOMMENT 
    SHA2_UNPACK32(len_b, (hex(id(m_block)) + pm_len - 4))
     

    transform1(m_block, block_nb)
    for i in range(0, 6):
        SHA2_UNPACK64(m_h[i], digest[i << 3])
    






## Input length!!!
def sha384(string): 


    digest = "0" * DIGEST_SIZE
    # digest[DIGEST_SIZE]
    leng = len(string)
    # print(leng)
    update1(string, leng, m_len, m_tot_len)
    final1(digest)
    # buf = "\0" * (2*DIGEST_SIZE+1)
    # char buf[2*DIGEST_SIZE+1]
    buf =""
    # buf[2*DIGEST_SIZE] = 0

    # b = m_len
    # for i in range(0, 80):
    #     print(f"{sha512_k[i]}")


    for i in range(0, DIGEST_SIZE):
        buf+= "%02x" %int(digest[i])


        
    return buf







string = input ("Enter string to be hashed:  ")


output1 = sha384(string)


print(f"sha384 of '{string}' = {output1}")