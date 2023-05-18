import socket
from http.server import BaseHTTPRequestHandler, HTTPServer
import cv2
import numpy as np
import face_recognition
import math
import os, sys


class FaceRecognition:
    face_locations = []
    face_encodings = []
    face_names = []
    known_face_encodings = []
    known_face_names = []
    process_current_frame = True

    def __init__(self):
        self.encode_faces()

    def encode_faces(self):
        for image in os.listdir('faces'):
            face_image = face_recognition.load_image_file(f"faces/{image}")
            face_encoding = face_recognition.face_encodings(face_image)[0]

            self.known_face_encodings.append(face_encoding)
            self.known_face_names.append(image)
        print(self.known_face_names)

    def run_recognition(self, Frame):

        try:
            # Capture a frame
            frame = Frame

            # Only process every other frame of video to save time
            if self.process_current_frame:
                # Resize frame of video to 1/4 size for faster face recognition processing
                small_frame = cv2.resize(frame, (0, 0), fx=0.25, fy=0.25)

                # Convert the image from BGR color (which OpenCV uses) to RGB color (which face_recognition uses)
                rgb_small_frame = small_frame[:, :, ::-1]

                # Find all the faces and face encodings in the current frame of video
                self.face_locations = face_recognition.face_locations(rgb_small_frame)
                self.face_encodings = face_recognition.face_encodings(rgb_small_frame, self.face_locations)

                self.face_names = []
                for face_encoding in self.face_encodings:
                    # See if the face is a match for the known face(s)
                    matches = face_recognition.compare_faces(self.known_face_encodings, face_encoding)
                    name = "Unknown"
                    confidence = '???'

                    # Calculate the shortest distance to face
                    face_distances = face_recognition.face_distance(self.known_face_encodings, face_encoding)

                    best_match_index = np.argmin(face_distances)
                    if matches[best_match_index]:
                        name = self.known_face_names[best_match_index]
                        confidence = face_confidence(face_distances[best_match_index])

                    self.face_names.append(f'{name} ')

            self.process_current_frame = not self.process_current_frame

            # Display the results
            for (top, right, bottom, left), name in zip(self.face_locations, self.face_names):
                # Scale back up face locations since the frame we detected in was scaled to 1/4 size
                top *= 4
                right *= 4
                bottom *= 4
                left *= 4

                # Create the frame with the name
                cv2.rectangle(frame, (left, top), (right, bottom), (0, 0, 255), 2)
                cv2.rectangle(frame, (left, bottom - 35), (right, bottom), (0, 0, 255), cv2.FILLED)
                cv2.putText(frame, name, (left + 6, bottom - 6), cv2.FONT_HERSHEY_DUPLEX, 0.8, (255, 255, 255), 1)

            # Display the resulting image

            #cv2.imshow('Face Recognition', frame)
            #cv2.waitKey(0)
            return name
            # Hit 'q' on the keyboard to quit!

            # with open('myfile.txt', 'w') as f:
            #     f.write("start\n")
            #     if name != "Unknown (???)":
            #         f.write(name)
            #     else:
            #         f.write("off")

        except:
            pass
        # Release handle to the webcam
        cv2.destroyAllWindows()


fr = FaceRecognition()


def face_confidence(face_distance, face_match_threshold=0.6):
    range = (1.0 - face_match_threshold)
    linear_val = (1.0 - face_distance) / (range * 2.0)

    if face_distance > face_match_threshold:
        return str(round(linear_val * 100, 2)) + '%'
    else:
        value = (linear_val + ((1.0 - linear_val) * math.pow((linear_val - 0.5) * 2, 0.2))) * 100
        return str(round(value, 2)) + '%'


class myRequestHandler(BaseHTTPRequestHandler):
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
        result = fr.run_recognition(frame)

        # Send response
        self.send_response(200)

        self.send_header('Content-type', 'text/plain')
        self.send_header('Access-Control-Allow-Origin', '*')
        self.end_headers()
        print(result)
        if result != 'Unknown':
            self.wfile.write(b'Unknown.')
        else:
            self.wfile.write(result)

    def do_GET(self):
        client_ip = self.client_address[0]
        print("Received request from", client_ip)
        print(self.path)
        with open('myfile.txt', 'r') as f:
            file_content = f.read()
            search_string = "off"
            if search_string in file_content:
                message = "not found"
                status_code = 200
            else:
                message = "found"
                status_code = 404
        self.send_response(status_code)
        self.send_header('Content-type', 'text/plain')
        self.end_headers()
        self.wfile.write(message.encode('utf-8'))


def run():
    port = 8070
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
