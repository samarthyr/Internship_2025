                                        --  Assignment 4: SQL -- 

-- 1. Select employee details  of dept number 10 or 30
SELECT * FROM Emp WHERE DeptNo IN (10, 30);

-- 2.  Fetch all the dept details with more than 1 employee
SELECT DeptNo, Dname, Loc 
FROM Dept 
WHERE DeptNo IN (SELECT DeptNo FROM Emp GROUP BY DeptNo HAVING COUNT(*) > 1);

-- 3. Fetch employee details whose name starts with the letter “S”
SELECT * FROM Emp WHERE Ename LIKE 'S%';

-- 4. Select Emp Details Whose experience is more than 2 years
SELECT * FROM Emp 
WHERE DATEDIFF(YEAR, Hire_Date, GETDATE()) > 2;

-- 5. Replace the char “a” with “#” in Employee Name
SELECT Ename, REPLACE(Ename, 'a', '#') AS Modified_Name FROM Emp;

-- 6. Fetch employee name and his/her manager name
SELECT e1.Ename AS Employee, e2.Ename AS Manager
FROM Emp e1
LEFT JOIN Emp e2 ON e1.Mgr = e2.EmpNo;

-- 7. Fetch Dept Name, Total Salary of the Dept
SELECT d.Dname, SUM(e.Sal) AS Total_Salary
FROM Emp e 
JOIN Dept d ON e.DeptNo = d.DeptNo
GROUP BY d.Dname;

-- 8. Fetch ALL employee details along with department name and location
SELECT e.*, d.Dname, d.Loc 
FROM Emp e 
RIGHT JOIN Dept d ON e.DeptNo = d.DeptNo

-- 9. Increase the employee salary by 10%
UPDATE Emp 
SET Sal = Sal * 1.10;

-- 10. Delete employees belonging to Chennai location
DELETE FROM Emp 
WHERE DeptNo IN (SELECT DeptNo FROM Dept WHERE Loc = 'Chennai');
