-- SET hivevar:username=loic;
-- SET hivevar:username=CharleneBruno;
SET hivevar:username=gauthier;
SET hivevar:group=2;

DROP TABLE IF EXISTS  ece_2020_fall_bda_${​​​​group}​​​​.${​​​​username}​​​​_covid19_orc;

CREATE TABLE IF NOT EXISTS ece_2020_fall_bda_${​​​​group}​​​​.${​​​​username}​​​​_covid19_orc (
departement INT,
sexe INT,
jour DATE,
hospitalisation INT,
reanimation INT,
guerison INT,
deces INT
)
STORED AS ORC;


INSERT INTO ece_2020_fall_bda_​${​​​​group}.${​​​​username}​​​​_covid19_orc
SELECT departement,
sexe,
jour,
hospitalisation,
reanimation,
guerison,
deces
FROM  ece_2020_fall_bda_${​​​​group}.${​​​​username}​​​​_covid19
WHERE departement>=01 AND departement<=976;