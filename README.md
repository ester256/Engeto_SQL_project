# Engeto_SQL_project

## Zadání projektu

Na vašem analytickém oddělení nezávislé společnosti, která se zabývá životní úrovní občanů, jste se dohodli, že se pokusíte odpovědět na pár definovaných výzkumných otázek, které adresují dostupnost základních potravin široké veřejnosti. Kolegové již vydefinovali základní otázky, na které se pokusí odpovědět a poskytnout tuto informaci tiskovému oddělení. Toto oddělení bude výsledky prezentovat na následující konferenci zaměřené na tuto oblast.

Potřebují k tomu od vás připravit robustní datové podklady, ve kterých bude možné vidět porovnání dostupnosti potravin na základě průměrných příjmů za určité časové období.

Jako dodatečný materiál připravte i tabulku s HDP, GINI koeficientem a populací dalších evropských států ve stejném období, jako primární přehled pro ČR.

### Datové sady, které je možné požít pro získání vhodného datového podkladu
#### Primární tabulky:

czechia_payroll – Informace o mzdách v různých odvětvích za několikaleté období. Datová sada pochází z Portálu otevřených dat ČR.

czechia_payroll_calculation – Číselník kalkulací v tabulce mezd.

czechia_payroll_industry_branch – Číselník odvětví v tabulce mezd.

czechia_payroll_unit – Číselník jednotek hodnot v tabulce mezd.

czechia_payroll_value_type – Číselník typů hodnot v tabulce mezd.

czechia_price – Informace o cenách vybraných potravin za několikaleté období. Datová sada pochází z Portálu otevřených dat ČR.

czechia_price_category – Číselník kategorií potravin, které se vyskytují v našem přehledu.


#### Číselníky sdílených informací o ČR:

czechia_region – Číselník krajů České republiky dle normy CZ-NUTS 2.

czechia_district – Číselník okresů České republiky dle normy LAU.

#### Dodatečné tabulky:

countries - Všemožné informace o zemích na světě, například hlavní město, měna, národní jídlo nebo průměrná výška populace.

economies - HDP, GINI, daňová zátěž, atd. pro daný stát a rok.
﻿

### Výzkumné otázky

1. Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?
2. Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?
3. Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)? 
4. Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?
5. Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo následujícím roce výraznějším růstem?
﻿

### Výstupy z projektu
Pomozte kolegům s daným úkolem. Výstupem by měly být dvě tabulky v databázi, ze kterých se požadovaná data dají získat. Tabulky pojmenujte t_{jmeno}_{prijmeni}_project_SQL_primary_final (pro data mezd a cen potravin za Českou republiku sjednocených na totožné porovnatelné období – společné roky) a t_{jmeno}_{prijmeni}_project_SQL_secondary_final (pro dodatečná data o dalších evropských státech).

Dále připravte sadu SQL, které z vámi připravených tabulek získají datový podklad k odpovězení na vytyčené výzkumné otázky. Pozor, otázky/hypotézy mohou vaše výstupy podporovat i vyvracet! Záleží na tom, co říkají data.

Na svém GitHub účtu vytvořte veřejný repozitář, kam uložíte všechny informace k projektu – hlavně SQL skript generující výslednou tabulku, popis mezivýsledků (průvodní listinu) ve formátu markdown (.md) a informace o výstupních datech (například kde chybí hodnoty apod.).

Neupravujte data v primárních tabulkách! Pokud bude potřeba transformovat hodnoty, dělejte tak až v tabulkách nebo pohledech, které si nově vytváříte.

---

## Řešení

1. Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?
Za zkoumané období (roky 2006-2018) mzdy narostly ve všech odvětvích, ovšem procento nárůstu mezd se mezi jednotlivými odvětvími diametrálně liší. Zatímco ve zpracovatelském průmyslu narostly mzdy o 132 % (18 078 korun), v sektoru Ubytování, stravování a pohostinství byl nárůst pouze 10 % (1 165 korun). V předposledním roce zkoumaného období přitom mzdy vyskočily o téměř 12 %, v posledním roce však skočily dolů o 27 %, takže ve výsledku byl nárůst vskutku mizivý. Nejvyšší peněžní ohodnocení se dostalo na konci zkoumaného období sektoru Informační a komunikační činnosti. Tento sektor také získal nejvíce přidáno - celkem přes 24 tisíc. Předběhl svou výškou mezd i sektor Peněžnictví a pojišťovnictví, který začínal s nejvyšší průměrnou mzdou.

2. Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?
Za první zkoumané období (rok 2006) je možné si koupit za průměrnou mzdu 1 201 kg chleba a 1 341 litrů mléka. Za poslední zkoumané období (rok 2018) je možné si koupit o 4 % více chleba (1 250 kg) a o 14 % více litrů mléka (1 529 litrů).

3. Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?
Nejlépe je na tom cukr krystal a rajčata, ta nezdražují vůbec. Naopak dokonce za zkoumané období zlevnila, a to o 27 % a 23 %.

4. Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?
Ano, k této situaci došlo v roce 2013, kdy průměrná cena potravin vzrostla o 5,1 % a průměrná mzda klesla o 6,76 %. K podobné situaci došlo i v roce 2017, kdy ceny potravin v průměru stouply o 9,63 %, ale průměrná mzda klesla o 0,1 %.

5. Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo následujícím roce výraznějším růstem?
Ano, na datech za zkoumané období pozorujeme vliv HDP na výšku platů i cen potravin.
Například v roce 2009 se HDP propadlo o 4,66 % a v následujícím roce mzdy klesly o jedno procento. Ceny potravin v roce 2009 výrazně zlevnily, následujícího roku zdražily jen o 1,95 %.
Podobný trend vidíme i v roce 2013, kdy stagnující HDP srazilo mzdy o 6,76 %. Ceny potravin ve stejném roce vzrostly o 5,1 %, ale v následujícím letech mírně poklesly.
Příkladem pozitivního vlivu růstu HDP pak jsou roky 2015 až 2018. HDP stouplo v roce 2015 a 2017 vždy o minimálně 5 %. V následujících letech - 2016 a 2018 - pak platy skokově stouply o 7 % a 13 %.
Nutné je podotknout, že HDP není jediným faktorem ovlivňující výšku mezd či ceny potravin.


## Komentář k datovým zdrojům
Data v tabulkách nejsou úplná - pro některé roky můžou jisté údaje chybět. Pro tento projekt bylo zkoumáno pouze období, kde byla k dispozici úplná ekonomická data.
Součástí podkladů je také tabulka t_ester_bubikova_project_sql_secondary_final, která obsahuje informace o evropských státech. V analýze nebyla tabulka použita, ale přikládám ji, jelikož byla vyžádána.
