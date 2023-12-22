-- How many cars has been sold per employee
SELECT emp.employeeId,
    emp.firstName,
    emp.lastName,
    count(*) as NumOfCarsSold
FROM sales sls
    INNER JOIN employee emp ON sls.employeeId = emp.employeeId
GROUP BY emp.employeeId,
    emp.firstName,
    emp.lastName
ORDER BY NumOfCarsSold DESC;