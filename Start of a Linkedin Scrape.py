# Import libraries
import requests
from bs4 import BeautifulSoup

s= ""
# URL from which pdfs to be downloaded
#url = "https://www.geeksforgeeks.org/how-to-extract-pdf-tables-in-python/"
cname = "fis" #Enter company name here

url = "https://www.linkedin.com/company/"+cname+"/posts/?feedView=all"
print(url)
print("--------------------------------------------")
response = requests.get(url)

soup = BeautifulSoup(response.text, 'html.parser')
print(soup)
texts = soup.find_all('a')
print("--------------------------------------------")
print(texts)
