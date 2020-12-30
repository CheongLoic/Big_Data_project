SET hivevar:username=loic;
-- SET hivevar:username=CharleneBruno;
-- SET hivevar:username=gauthier;
SET hivevar:group=2;

DROP TABLE IF EXISTS  ece_2020_fall_bda_${​​​​group}​​​​.${​​​​username}​​​​_covid19_parquet;

CREATE TABLE IF NOT EXISTS ece_2020_fall_bda_${​​​​group}​​​​.${​​​​username}​​​​_covid19_parquet (
departement INT,
sexe INT,
jour DATE,
hospitalisation INT,
reanimation INT,
guerison INT,
deces INT
)
STORED AS PARQUET
LOCATION '/education/ece/big-data/2020/fall/bda/gr2/loic/projetBigData/parquet_files';


INSERT INTO ece_2020_fall_bda_​${​​​​group}.${​​​​username}​​​​_covid19_parquet
SELECT departement,
sexe,
jour,
hospitalisation,
reanimation,
guerison,
deces
FROM  ece_2020_fall_bda_${​​​​group}.${​​​​username}​​​​_covid19
WHERE departement>=01 AND departement<=976;

-- describe formatted ece_2020_fall_bda_${​​​​group}​​​​.${​​​​username}​​​​_covid19_parquet; 