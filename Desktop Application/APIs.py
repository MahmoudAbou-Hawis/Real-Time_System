import requests

class MyAPI:
    def __init__(self, ip, service):
        self.ip = ip
        self.service = service
        self.base_url = f"http://{self.ip}/{self.service}"
        
    def send_request(self, params=None):
        url = self.base_url
        if params:
            url += "?"
            for key, value in params.items():
                url += f"{key}={value}&"
            url = url[:-1]  # remove trailing '&' or '?'
        response = requests.get(url)
        return response.text
my_api = MyAPI("192.168.1.1", "myservice")
response_text = my_api.send_request(params={"param1": "value1", "param2": "value2"})
print(response_text)