#! /usr/bin/env /usr/local/bin/python3.3
# -*- coding: utf-8 -*-
"""
Created on Mon Dec 28 14:01:19 2020

@author: Loic CHEONG, Charlène Bruno
"""
import requests
import csv
import os
from subprocess import PIPE, Popen

csv_url = "https://www.data.gouv.fr/fr/datasets/r/63352e38-d353-4b54-bfd1-f1b3ee1cabd7"

req = requests.get(csv_url)
url_content = req.content
url_content = str(url_content)
url_content = url_content.replace('"','')
url_content = url_content.replace(';',',')
url_content = url_content.split("\\n")
del url_content[-1]
url_content[0] = "département,sexe,jour,hospitalisation,réanimation,guérison,mort"

Liste = []
for i in range(len(url_content)):
    l = url_content[i].split(",")
    Liste.append(l)
    
    
with open("covid19_DB.csv", 'w', newline='') as csvfile:
    writer = csv.writer(csvfile)
    writer.writerows(Liste)

# define path to saved file
file_name = "covid19_DB.csv"
hdfs_path =  '/education/ece/big-data/2020/fall/bda/gr2/loic/projetBigData/covid19_data'
#hdfs_path =  '/education/ece/big-data/2020/fall/bda/gr2/CharleneBruno/projetBigData/covid19_data'
#hdfs_path =  '/education/ece/big-data/2020/fall/bda/gr2/gauthier/projetBigData/covid19_data'

#Create a directoty in HDFS
#mkdir = Popen(["hdfs", "dfs", "-mkdir", hdfs_path], stdin=PIPE, bufsize=-1)
#mkdir.communicate()


# create path to your username on hdfs
hdfs_path = os.path.join(hdfs_path, file_name)

#remove file in HDFS
rm = Popen(["hdfs", "dfs", "-rm", hdfs_path], stdin=PIPE, bufsize=-1)
rm.communicate()

# put csv into hdfs
put = Popen(["hdfs", "dfs", "-put", file_name, hdfs_path], stdin=PIPE, bufsize=-1)
put.communicate()





