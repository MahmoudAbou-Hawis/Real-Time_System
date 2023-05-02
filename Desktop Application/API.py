import requests
url='http://www.Google.com'
#url = 'https://date.nager.at/api/v2/publicholidays/2020/US'
response = requests.get(url)
print(response)  # print HTTP status code
var = response.status_code# print HTTP status code
print(var)
print("-------------------------------------------")
print(dir(response))
print("-------------------------------------------")
print(response.text) 
print("-------------------------------------------")