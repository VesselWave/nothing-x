"""Local TCP relay for an ADB daemon lacking macOS LAN access. No traffic logging."""
import select
import socket
import threading

def relay(client):
    try:
        with client, socket.create_connection(('192.168.86.22', 43373), 5) as remote:
            peers = {client: remote, remote: client}
            while True:
                ready, _, _ = select.select(list(peers), [], [], 60)
                for source in ready:
                    data = source.recv(65536)
                    if not data:
                        return
                    peers[source].sendall(data)
    except OSError as error:
        print(type(error).__name__, flush=True)

with socket.socket() as server:
    server.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
    server.bind(('127.0.0.1', 14337))
    server.listen()
    print('Relay listening on 127.0.0.1:14337', flush=True)
    while True:
        client, _ = server.accept()
        threading.Thread(target=relay, args=(client,), daemon=True).start()
