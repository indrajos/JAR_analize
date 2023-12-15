# JAR_analize

Užduočiai atlikti naudoti 7 csv failai iš Valstybės įmonės Registrų centro puslapyje esančių viešų duomenų: juridinių asmenų registro (JAR) ir adresų registro (AR).
 
Duomenys suimportuoti į PostgreSQL duomenų bazę. 
Vizualizacijai atlikti apjungti 5 aktualių duomenų rinkiniai (views), siekiant rezultatų gavimo greičio.
Duomenų bazė sujungta su Tableau programa. 
Vizualizacijos: https://public.tableau.com/app/profile/indre1935/viz/JAR_analize/apskritis

Pastebėta, kad faile jar_adresai trūksta (NULL reikšmės) 13.194 (6 proc.) aob_kodu iš 239.657 įregistruotų JA.

Išregistruotų JA susieti su savivaldybe nėra galimybės, kadangi jų aob_kodų faile jar_adresai iš viso nėra pateikti.
