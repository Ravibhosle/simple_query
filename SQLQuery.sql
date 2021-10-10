


--List community areas with per capita income less than 1100?
SELECT
COMMUNITY_AREA_NAME
FROM chicago..chicagocensusdata
WHERE PER_CAPITA_INCOME < 11000;

--List all case numbers for crimes involving minors?
SELECT 
CASE_NUMBER 
FROM Chicago..chicagocrimedata
WHERE DESCRIPTION like '%minor';

-- list all kidnapping crimes involving a child?
SELECT 
CASE_NUMBER,PRIMARY_TYPE, DESCRIPTION
FROM Chicago..chicagocrimedata
WHERE PRIMARY_TYPE= 'kidnapping' AND DESCRIPTION LIKE 'child%';

--what kind of crimes were recorded at schools?
SELECT 
PRIMARY_TYPE 
FROM Chicago..chicagocrimedata
WHERE LOCATION_DESCRIPTION LIKE 'School%';

--LIST 5 Community areas with highest % of thousands below poverty line?
SELECT 
COMMUNITY_AREA_NAME,COMMUNITY_AREA_NUMBER
FROM Chicago..ChicagoCensusData
ORDER BY PERCENT_HOUSEHOLDS_BELOW_POVERTY DESC LIMIT 5;

-- Use sub-query to find the name of the communty area with highest hardship index?
SELECT COMMUNITY_AREA_NAME 
FROM Chicago..ChicagoCensusData
WHERE HARDSHIP_INDEX = (SELECT MAX(HARDSHIP_INDEX)
FROM Chicago..ChicagoCensusData); 

--Use the sub-query to determine the community area name with most number of crime?
select community_area_name
from Chicago..ChicagoCensusData
where community_area_number = 
(select community_area_number from (select * 
from (select community_area_number,
count(community_area_number) as crimes_in_community from
Chicago..ChicagoCensusData group by community_area_number)
where crimes_in_community =
(select max(crimes_in_community) 
from (select community_area_number, count(community_area_number)
as crimes_in_community from Chicago..ChicagoCensusData group by community_area_number;
   
   
   
   