import socket
from http.server import BaseHTTPRequestHandler, HTTPServer

class myRequestHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        client_ip = self.client_address[0]
        print("Received request from", client_ip)
        print(self.path)
        self.send_response(200)
        self.send_header('Content-type', 'text/plain')
        self.end_headers()
        self.wfile.write(b'received')

def run():
    port = 8080
    host = ''
    for iface in socket.if_nameindex():
        if iface[1] == 'lo':
            continue
        s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        s.connect(('8.8.8.8', 80))
        host = s.getsockname()[0]
        s.close()
        break
    if not host:
        print('Error: could not determine IP address to bind to')
        return
    httpd = HTTPServer((host, port), myRequestHandler)
    print('Server started at http://{}:{}/'.format(host, port))
    httpd.serve_forever()
run()