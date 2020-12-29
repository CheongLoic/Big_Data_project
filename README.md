# Big_Data_project
Projet scolaire auto-ingestion de fichiers csv (Hive, oozie)


- `hdfs dfs -put -f oozie/ "/user/l.cheong-ece"`
- `oozie job -run -config oozie/job.properties -oozie http://oozie-1.au.adaltas.cloud:11000/oozie`
copy the job_ID, then run `oozie job -info <job_ID> -oozie http://oozie-1.au.adaltas.cloud:11000/oozie`

