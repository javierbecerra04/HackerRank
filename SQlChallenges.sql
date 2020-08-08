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