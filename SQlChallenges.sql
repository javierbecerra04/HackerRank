-- Type of Triangle Challenge
SELECT 
CASE
    WHEN A+B<=C OR A+C<=B OR B+C<=A THEN 'Not A Triangle'
    WHEN A=B and B=C THEN 'Equilateral'
    WHEN A=B OR A=C OR B=C THEN 'Isosceles'
    WHEN A<>B AND A<>C AND B<>C THEN 'Scalene'
END
FROM TRIANGLES;

-- The PADS Challenge
SELECT CONCAT(b.Name,"(",LEFT(b.Occupation, 1),")")
FROM 
    (SELECT Name, Occupation
    FROM OCCUPATIONS
    ORDER BY Name) as b;
SELECT CONCAT("There are a total of ",a.NumProf," ",LOWER(a.Occupation),"s.")
FROM
    (SELECT Occupation, COUNT(*) AS NumProf
    FROM OCCUPATIONS
    GROUP BY Occupation
    ORDER BY NumProf ASC,Occupation ASC) as a;

-- Occupations Challenge
SET @r1=0, @r2=0, @r3 =0, @r4=0;
SELECT MIN(Doctor), MIN(Professor), MIN(Singer), MIN(Actor) FROM
(SELECT CASE Occupation WHEN 'Doctor' THEN @r1:=@r1+1
                        WHEN 'Professor' THEN @r2:=@r2+1
                        WHEN 'Singer' THEN @r3:=@r3+1
                        WHEN 'Actor' THEN @r4:=@r4+1 END
       AS RowLine,
       CASE WHEN Occupation = 'Doctor' THEN Name END AS Doctor,
       CASE WHEN Occupation = 'Professor' THEN Name END AS Professor,
       CASE WHEN Occupation = 'Singer' THEN Name END AS Singer,
       CASE WHEN Occupation = 'Actor' THEN Name END AS Actor
       FROM OCCUPATIONS ORDER BY Name) AS t
GROUP BY RowLine;

-- African Cities Challenge
SELECT CITY.NAME
FROM CITY
LEFT JOIN COUNTRY
ON CITY.COUNTRYCODE = COUNTRY.CODE
WHERE COUNTRY.CONTINENT = "Africa";

-- Average Population of Each Continent Challenge
SELECT DISTINCT(COUNTRY.CONTINENT), FLOOR(AVG(CITY.POPULATION)) --FLOOR is for round down
FROM COUNTRY
JOIN CITY
ON COUNTRY.CODE = CITY.COUNTRYCODE
GROUP BY COUNTRY.CONTINENT;