import http.server
import socketserver
import socket
from twilio.rest import Client
import os
from twilio.rest import Client
import secrets
import string
import requests

account_sid = "AC8db1c278ff371d83a5695f86c8494d72"
auth_token = "9f5f21c8f9fc72ee921d20186c3f7b97"




temp_client = Client(account_sid, auth_token)
service = temp_client.verify.v2.services.create(
                                        friendly_name='SquadRTOS system'
                                    )
verify_sid = service.sid


def generate_auth_token():
    alphabet = string.ascii_letters + string.digits
    token = ''.join(secrets.choice(alphabet) for i in range(128))
    return token


def send_otp(NumberPhone):
    global verified_number
    verified_number = NumberPhone
    verification = temp_client.verify \
        .services(verify_sid) \
        .verifications \
        .create(to=verified_number, channel="sms")
    print(verification.status)

def verify_otp(OTP):
    print(verified_number)
    verification_check = temp_client.verify.v2.services(verify_sid) \
        .verification_checks \
        .create(to=verified_number, code=OTP)
    return (verification_check.status)

class MyHandler(http.server.SimpleHTTPRequestHandler):
    def Response200(self):
        self.send_response(200)
        self.send_header('Content-type', 'text/plain')
        self.send_header('Access-Control-Allow-Origin', '*')
        self.end_headers()
    def do_GET(self):
        print(self.path)
        API = ''
        for chr in self.path:
            if chr == '?':
                break
            else:
                API+=chr
       # print('Headers :',self.headers)
        params = self.path.split('?')
        if len(params) > 1:
            params = params[1].split('&')
            params = {p.split('=')[0]: p.split('=')[1] for p in params}
        else:
            params = {}
        if str(API) == '/send_otp':
            send_otp('+2'+params['phone'])
            self.Response200()
            self.wfile.write(b'OTP Sent')
        elif str(API) == '/check_otp':
           status = verify_otp(str(params['OTP']))
           if status == 'pending' :
               self.Response200()
               self.wfile.write(b'Wrong OTP!')
           elif status == 'approved':
               self.Response200()
               self.wfile.write(b'Accepted!')






PORT = 8080

with socketserver.TCPServer(("", PORT), MyHandler) as httpd:
    ip_address = socket.gethostbyname(socket.gethostname())
    print(f"Serving at http://{ip_address}:{PORT}/")
    httpd.serve_forever()