-- SET hivevar:username=loic;
-- SET hivevar:username=CharleneBruno;
SET hivevar:username=gauthier;
SET hivevar:group=2;

DROP TABLE IF EXISTS  ece_2020_fall_bda_${​​​​group}​​​​.${​​​​username}​​​​_covid19;

CREATE EXTERNAL TABLE IF NOT EXISTS ece_2020_fall_bda_${​​​​group}​​​​.${​​​​username}​​​​_covid19 (
departement INT,
sexe INT,
jour DATE,
hospitalisation INT,
reanimation INT,
guerison INT,
deces INT
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
STORED AS TEXTFILE
LOCATION '/education/ece/big-data/2020/fall/bda/gr${​​​​group}​​​​/${​​​​username}​​​​/projetBigData/covid19_data'
TBLPROPERTIES ('skip.header.line.count'='1');