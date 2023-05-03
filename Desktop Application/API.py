import requests
url='http://www.Google.com' #ip here like 192.168.1.1 Cuz we are in a local Network
#Api format ip/ServiceName?params=FirstparamValue&params=SecondparamValue if params Found
Api = '/'
response = requests.get(url)
print(response)  # print HTTP status code
var = response.status_code# print HTTP status code
print(var)
print("-------------------------------------------")
print(dir(response))
print("-------------------------------------------")
print(response.text) 
print("-------------------------------------------")


#make it in a class and take an ip and Service as string