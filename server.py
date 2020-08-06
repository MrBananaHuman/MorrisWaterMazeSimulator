import socket
import random

HOST = '127.0.0.1'
PORT = 3030
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.bind((HOST, PORT))
s.listen(1)
conn, addr = s.accept()
print('Connected by', addr)
conn.send(str(-1).encode())

def get_state():
    state = conn.recv(1024).decode()
    if not state:
        return null
    return str(state)	#  reward / d_from_east / d_from_west / d_from_south / d_from_north

def send_action(action_number):
    conn.send(str(action_number).encode())
 
def close_connection():
    conn.close()


while(True):
    states = get_state()
    reward = states.split('/')[0]
    # if reward != "0":
    print(states)
    send_action(random.randint(0, 3))

