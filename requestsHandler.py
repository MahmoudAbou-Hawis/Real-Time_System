
class FrameHandler(http.server.BaseHTTPRequestHandler):
    def do_OPTIONS(self):
        self.send_response(200)
        self.send_header('Access-Control-Allow-Origin', '*')
        self.send_header('Access-Control-Allow-Methods', 'POST')
        self.send_header('Access-Control-Allow-Headers', 'Content-Type')
        self.send_header('Access-Control-Max-Age', '86400')
        self.end_headers()

    def do_POST(self):
        content_length = int(self.headers.get('Content-Length'))
        data = self.rfile.read(content_length)
        np_array = np.frombuffer(data, dtype=np.uint8)
        frame = cv2.imdecode(np_array, cv2.IMREAD_COLOR)
        cv2.imshow('image', frame)
        cv2.waitKey(1)
        # Send response
        self.send_response(200)
        self.send_header('Content-type', 'text/plain')
        self.end_headers()
        self.wfile.write(b'Frame received.')
