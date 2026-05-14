import argparse
import socket


def run_client(host: str = "127.0.0.1", port: int = 5000, message: str = "Hello from client") -> None:
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
        s.connect((host, port))
        s.sendall(message.encode())
        data = s.recv(1024)
        print("Server replied:", data.decode(errors="ignore"))


def main():
    parser = argparse.ArgumentParser(description="Simple TCP client")
    parser.add_argument("--host", default="127.0.0.1", help="Server host/IP (default: 127.0.0.1)")
    parser.add_argument("--port", type=int, default=5000, help="Server port (default: 5000)")
    parser.add_argument("--message", default="Hello from client", help="Message to send")
    args = parser.parse_args()

    run_client(args.host, args.port, args.message)


if __name__ == "__main__":
    main()
