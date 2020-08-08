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

-- The Report Challenge
SELECT
CASE
    WHEN Marks >= 70 THEN Name
    WHEN Marks < 70 THEN NULL
END AS Name,
CASE
    WHEN Marks>=70 and Marks<80 THEN 8
    WHEN Marks>=80 and Marks<90 THEN 9
    WHEN Marks>=90 and Marks<=100 THEN 10
END AS Grade,
Marks AS Mark
FROM Students
WHERE Marks>=70
ORDER BY Grade DESC,Name;
SELECT
NULL AS Name,
CASE
    WHEN Marks>=0 and Marks<10 THEN 1
    WHEN Marks>=10 and Marks<20 THEN 2
    WHEN Marks>=20 and Marks<30 THEN 3
    WHEN Marks>=30 and Marks<40 THEN 4
    WHEN Marks>=40 and Marks<50 THEN 5
    WHEN Marks>=50 and Marks<60 THEN 6
    WHEN Marks>=60 and Marks<70 THEN 7
END AS Grade,
Marks AS Mark
FROM Students
WHERE Marks<70
ORDER BY Grade DESC,Marks ASC;