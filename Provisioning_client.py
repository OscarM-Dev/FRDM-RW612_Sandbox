import socket

def tcp_client():
    server_ip = '192.168.1.1' #insert here board ip.
    server_port = 10001

    try:
        with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as sock:
            sock.connect((server_ip, server_port))
            print(f"Connected to {server_ip}:{server_port}")

            while True:
                message = input("Enter WiFi SSID and PSWD for board, one credential at a time (* to quit): ")
                if message == '*':
                    print("Exiting.")
                    break

                # Send message
                sock.sendall(message.encode())

                # Receive response
                response = sock.recv(4096)
                if not response:
                    print("Server closed the connection.")
                    break

                print("Server response:", response.decode())

    except ConnectionRefusedError:
        print("Connection failed. Is the server running?")
    except Exception as e:
        print(f"An error occurred: {e}")

if __name__ == "__main__":
    tcp_client()