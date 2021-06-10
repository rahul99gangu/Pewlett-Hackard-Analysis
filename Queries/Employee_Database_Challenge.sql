--Deliverable 1.

--Retrieve the emp_no, first_name, and last_name columns from the Employees table.
--Retrieve the title, from_date, and to_date columns from the Titles table.
--Create a new table using the INTO clause.
--Join both tables on the primary key.
--Filter the data on the birth_date column to retrieve the employees who were born between 1952 and 1955. Then, order by the employee number.
SELECT emp.emp_no, emp.first_name, emp.last_name, tle.title, tle.from_date, tle.to_date
INTO retirement_titles
FROM employees as emp 
INNER JOIN titles as tle ON emp.emp_no = tle.emp_no 
WHERE (emp.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
order by emp.emp_no
	
--Export the Retirement Titles table from the previous step as retirement_titles.csv and save it to your Data folder in the Pewlett-Hackard-Analysis folder.

Select * from retirement_titles

--Copy the query from the Employee_Challenge_starter_code.sql and add it to your Employee_Database_challenge.sql file.
--Retrieve the employee number, first and last name, and title columns from the Retirement Titles table.
--These columns will be in the new table that will hold the most recent title of each employee.
--Use the DISTINCT ON statement to retrieve the first occurrence of the employee number for each set of rows defined by the ON () clause.
--Create a Unique Titles table using the INTO clause.
--Sort the Unique Titles table in ascending order by the employee number and descending order by the last date (i.e. to_date) of the most recent title.
SELECT DISTINCT ON (emp_no) emp_no,
first_name, last_name, title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

--Export the Unique Titles table as unique_titles.csv and save it to your Data folder in the Pewlett-Hackard-Analysis folder.
--Before you export your table, confirm that it looks like this image:

select * from unique_titles

--Write another query in the Employee_Database_challenge.sql file to retrieve the number of employees by their most recent job title who are about to retire.
--First, retrieve the number of titles from the Unique Titles table.
--Then, create a Retiring Titles table to hold the required information.
--Group the table by title, then sort the count column in descending order.

select count(title),title 
into retiring_titles
from unique_titles
group by title
order by 1 desc

--Export the Retiring Titles table as retiring_titles.csv and save it to your Data folder in the Pewlett-Hackard-Analysis folder.
--Before you export your table, confirm that it looks like this image:

select * from retiring_titles

--Deliverable 2

--Retrieve the emp_no, first_name, last_name, and birth_date columns from the Employees table.
--Retrieve the from_date and to_date columns from the Department Employee table.
--Retrieve the title column from the Titles table.
--Use a DISTINCT ON statement to retrieve the first occurrence of the employee number for each set of rows defined by the ON () clause.
--Create a new table using the INTO clause.
--Join the Employees and the Department Employee tables on the primary key.
--Join the Employees and the Titles tables on the primary key.
--Filter the data on the to_date column to all the current employees, then filter the data on the birth_date columns to get all the employees whose birth dates are between January 1, 1965 and December 31, 1965.
--Order the table by the employee number.
select distinct on (emp.emp_no) emp.emp_no, emp.first_name, emp.last_name, emp.birth_date, 
dptemp.from_date, dptemp.to_date,
tle.title
into mentorship_eligability
from employees emp
inner join dept_emp dptemp
on emp.emp_no=dptemp.emp_no
inner join titles tle
on tle.emp_no=emp.emp_no
WHERE  dptemp.to_date = '9999-01-01'
and (emp.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY emp.emp_no

--Export the Mentorship Eligibility table as mentorship_eligibilty.csv and save it to your Data folder in the Pewlett-Hackard-Analysis folder.
--Before you export your table, confirm that it looks like this image:

select * from mentorship_eligability

--Potential Hirings or Remotings needs to fill up
--Columns: Titles, Retiring Titles, Mentoring Titles
--Need to LEFT JOIN for title_counts
With titles_mentors as (
SELECT Title, Count(Title) FROM mentorship_eligability
GROUP BY Title
Order by title)
Select
rtle.title, rtle.count as retiring_title, tm.count as mentoring_titles
into side_by_side_titles
From retiring_titles as rtle
LEFT JOIN titles_mentors tm 
ON rtle.title = tm.title
Order By rtle.title

--Create a retirment title table with salary
SELECT emp.emp_no, emp.first_name, emp.last_name, 
tle.title, tle.from_date, tle.to_date,
sal.salary
INTO retirement_titles_2
FROM employees as emp 
INNER JOIN titles as tle ON emp.emp_no = tle.emp_no 
INNER JOIN salaries as sal ON emp.emp_no = sal.emp_no 
WHERE (emp.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
order by emp.emp_no

-- Salary Statistics of Retiring employees
With salary_stats as (
SELECT 'Assistant Engineer' as Title, Min(salary), Max(salary), Avg(salary),Count(salary),SUM(salary) FROM  retirement_titles_2 where title in ('Assistant Engineer')
UNION
SELECT 'Engineer' as Title, Min(salary), Max(salary), Avg(salary),Count(salary),SUM(salary) FROM  retirement_titles_2 where title in ('Engineer')
UNION
SELECT 'Manager' as Title, Min(salary), Max(salary), Avg(salary),Count(salary),SUM(salary) FROM  retirement_titles_2 where title in ('Manager')
UNION
SELECT 'Senior Engineer' as Title, Min(salary), Max(salary), Avg(salary),Count(salary),SUM(salary) FROM  retirement_titles_2 where title in ('Senior Engineer')
UNION
SELECT 'Senior Staff' as Title, Min(salary), Max(salary), Avg(salary),Count(salary),SUM(salary) FROM  retirement_titles_2 where title in ('Senior Staff')
UNION
SELECT 'Staff' as Title, Min(salary), Max(salary), Avg(salary),Count(salary),SUM(salary) FROM  retirement_titles_2 where title in ('Staff')
UNION
SELECT 'Technique Leader' as Title, Min(salary), Max(salary), Avg(salary),Count(salary),SUM(salary) FROM  retirement_titles_2 where title in ('Technique Leader')
)
SELECT * 
into salary_stats_retiring_employees
FROM salary_stats;

---

Select * from salary_stats_retiring_employees;