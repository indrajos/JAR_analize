-- JA KIEKIS TAM TIKRAIS METAIS

CREATE VIEW isregistruotu_kiekis AS 
SELECT 
	LEFT(j.ja_reg_data, 4) AS metai,
	count(j.ja_pavadinimas) AS isregistuotu_kiekis
FROM jar_isregistruoti j
GROUP BY metai
ORDER BY metai;

CREATE VIEW egzistuojanciu_kiekis AS 
SELECT 
	count(ji.ja_pavadinimas) AS egzistuojanciu_kiekis,
	LEFT(ji.ja_reg_data, 4) AS metai
FROM jar_iregistruoti ji 
GROUP BY metai
ORDER BY metai;

-- JA AKTUALŪS DUOMENYS

CREATE VIEW isregistruotu_duomenys AS 
SELECT 
	j.ja_kodas AS kodas,
	j.ja_reg_data AS iregistruota,
	j.isreg_data AS isregistruota,
	j.form_pavadinimas AS teisine_forma
FROM jar_isregistruoti j
ORDER BY iregistruota;


CREATE VIEW iregistruotu_duomenys_aob AS 
SELECT 
	ji.ja_kodas AS kodas, 
	ji.ja_reg_data AS iregistruota, 
	ji.form_pavadinimas AS teisine_forma, 
	ji.stat_pavadinimas AS statusas,
	ja.aob_kodas
FROM jar_iregistruoti ji 
FULL JOIN jar_adresai ja 
ON ji.ja_kodas = ja.ja_kodas
ORDER BY iregistruota;

 
-- JA SAVIVALDYBĖS IR APSKRITYS
CREATE VIEW ja_sav_apskr AS  
WITH sav_aob_kodai AS (
SELECT 
	ja.ja_kodas ,
	apl."SAV_KODAS" 
FROM jar_adresai ja	
JOIN adr_pat_lr apl 
ON apl."PAT_KODAS" = ja.aob_kodas
UNION 
SELECT 
	ja.ja_kodas ,
	asl."SAV_KODAS" 
FROM jar_adresai ja 
JOIN adr_stat_lr asl 
ON ja.aob_kodas = asl."AOB_KODAS" 
)

SELECT
	sak.ja_kodas, 
	as2."VARDAS_K" AS savivaldybe,
	aa."VARDAS_K" AS apskritis
FROM sav_aob_kodai sak
JOIN adr_savivaldybes as2 
ON as2."SAV_KODAS" = sak."SAV_KODAS" 
JOIN adr_apskritys aa 
ON aa."ADM_KODAS" = as2."ADM_KODAS";





