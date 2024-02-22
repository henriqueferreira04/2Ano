import socket
import signal
import sys
import threading
import readline

def signal_handler(sig, frame):
    print('\nDone!')
    sys.exit(0)

signal.signal(signal.SIGINT, signal_handler)
print('Press Ctrl+C to exit...')

ip_addr = "192.168.179.27"
tcp_port = 5005

sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

sock.connect((ip_addr, tcp_port))

def receive_messages(sock):
    while True:
        try:
            response = sock.recv(4096).decode()
            current_line = readline.get_line_buffer()
            sys.stdout.write('\rServer response: {}'.format(response))
            sys.stdout.flush()
            print("Message to send: {}".format(current_line))
        except (socket.timeout, socket.error):
            print('Server error. Done!')
            sys.exit(0)

threading.Thread(target=receive_messages, args=(sock,)).start()

while True:
    sys.stdout.write('\rMessage to send: ')
    sys.stdout.flush()
    message= input().encode()
    if len(message)>1:
        sock.send(message)