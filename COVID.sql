USE DBsales;


select * from covid1;	

alter table country_wise_latest1 rename to covid1;

ALTER TABLE covid1 rename column `Country/Region` to Country;


SELECT country, active as `active/cases` from covid1
order by active desc
limit 5;

SELECT country as Country, 
	confirmed as Confirmed,
	deaths as Deaths, 
    ROUND((deaths/ confirmed) *100,2 )as Morality_Rate 
	from covid1
	order by morality_rate desc
	limit 5;


SELECT Country, 
		confirmed,
		recovered, 
        ROUND((recovered / confirmed)*100,2) as Recovery_Rate 
        from covid1
		order by recovery_rate desc
		limit 5;

ALTER TABLE covid1 rename column `WHO Region` to WHO_REGION;

SELECT WHO_REGION, 
	sum(confirmed) as Confirmed, 
	sum(deaths) as Death, 
    sum(recovered) as Recovered 
    FROM COVID1
	group by who_region;
    
select country, confirmed, recovered,
round((recovered / confirmed)*100,2) as recovery_date
from covid1
where country ="Philippines";


select  country,
		`new cases`,
        `new deaths`,
       CONCAT(ROUND((`new deaths` / `new cases`) * 100, 2), '%') AS cases
         from covid1
         WHERE (`new deaths` / `new cases`) * 100 > 5
         order by (`new deaths` / `new cases`) desc
         limit 5;
       
select country, 
		deaths,
        recovered,
        ROUND((deaths / recovered) *100, 2) as Total_Deaths_Per_100_Recovered
        from covid1
        order by Total_Deaths_Per_100_Recovered desc
        limit 5;
 
 SELECT country, 
		active as Active_cases
        from covid1
        order by active_cases desc
        limit 5;
 
 
 SELECT WHO_REGION AS WHO, 
		count(country) as Total_Country_By_Who
        from covid1
        group by WHO
        order by Total_Country_By_Who desc;
 
 
SELECT * FROM COVID1
