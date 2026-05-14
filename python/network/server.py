import argparse
import socket


def run_server(host: str = "192.168.48.166", port: int = 5000) -> None:
    """Start a simple TCP server that accepts one message and responds."""
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as server:
        server.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        server.bind((host, port))
        server.listen(1)
        print(f"Server listening on {host}:{port}...")

        conn, addr = server.accept()
        with conn:
            print("Connected by:", addr)
            data = conn.recv(1024)
            if data:
                print("Received:", data.decode(errors="ignore"))
                conn.sendall(b"Message received successfully")
            else:
                print("No data received from client.")


def main():
    parser = argparse.ArgumentParser(description="Simple TCP server")
    parser.add_argument("--host", default="0.0.0.0", help="Host/IP to bind (default: 0.0.0.0)")
    parser.add_argument("--port", type=int, default=5000, help="Port to bind (default: 5000)")
    args = parser.parse_args()

    run_server(args.host, args.port)


if __name__ == "__main__":
    main()
