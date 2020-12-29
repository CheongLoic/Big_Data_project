# Big_Data_project
Ceci est un projet scolaire d'ECE Paris en Big Data Ecosystem 
Ce projet fait de l'auto-ingestion de données csv du Covid19 grâce à Oozie

Auteurs:
- BRUNO Charlène
- CHEONG Loïc

ECE Paris 2020/2021
ING5 BDA Gr02

# Comment exécuter le code ?
Activer *OpenVPN Connect* pour pouvoir vous connecter à votre session sur l'invite de commandes, PowerShell ou le terminal
![alt test](img/OpenVPN.PNG)

Une fois votre session ouvert ![alt test](img/session.PNG), cloner le projet `git clone https://github.com/CheongLoic/Big_Data_project.git` localement.
- `hdfs dfs -mkdir <hdfs_path>` (exemple: `hdfs dfs -mkdir /education/ece/big-data/2020/fall/bda/gr2/gauthier/projetBigData` )

- `hdfs dfs -put -f oozie/ "/user/<username>"`  (exemple: `hdfs dfs -put -f oozie/ "/user/<username>"` )
- `oozie job -run -config oozie/job.properties -oozie http://oozie-1.au.adaltas.cloud:11000/oozie`
copy the job_ID, then run `oozie job -info <job_ID> -oozie http://oozie-1.au.adaltas.cloud:11000/oozie`

