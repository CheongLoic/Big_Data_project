# -*- coding: utf-8 -*-
"""
Created on Mon Dec 28 14:01:19 2020

@author: Loic CHEONG
"""
import requests
import csv
csv_url = "https://www.data.gouv.fr/fr/datasets/r/63352e38-d353-4b54-bfd1-f1b3ee1cabd7"

req = requests.get(csv_url)
url_content = req.content
url_content = str(url_content)
url_content = url_content.replace('"','')
url_content = url_content.replace(';',',')
url_content = url_content.split("\\n")
del url_content[-1]
url_content[0] = "dep,sexe,jour,hosp,rea,rad,dc"

Liste = []
for i in range(len(url_content)):
    l = url_content[i].split(",")
    Liste.append(l)
    
    
with open('../covid19_DB.csv', 'w', newline='') as csvfile:
    writer = csv.writer(csvfile)
    writer.writerows(Liste)


