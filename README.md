# Pewlett Hackard Analysis

### Project Summary

This Project is to determine number of retiring employees per title, and identify employees who are eligible to participate in a mentorship program with the new list of potential mentors, list of current employees eligible for retirement, as well as their most recent titles.

1. A list of current employees eligible for retirement, retiring titles and unique retiring titles.
2. A list of most recent titles: "The Most Recent Titles"
3. A list of potential mentors: "Who’s Ready for a Mentor?"

***Additional 2 SQL's:***

1. Potential Hirings
2. Salary statistics of retiring employees
___

#### Database

- Postgre SQL 11
- pgAdim version 5.3


***Deliverable 1:*** A list of current employees eligible for retirement, retiring titles and unique retiring titles.

***DB Tables***
- Employee
- Title

***Required Columns:*** 
- Employee number
- First and last name
- Title
- from_date
- to-date

***Steps of Queries:***

- Retrieve the emp_no, first_name, and last_name columns from the Employees table.
- Retrieve the title, from_date, and to_date columns from the Titles table.
- Create a new table using the INTO clause.
- Join both tables on the primary key.
- Filter the data on the birth_date column to retrieve the employees who were born between 1952 and 1955. -  Then, order by the employee number.
- Export the Retirement Titles table from the previous step as retirement_titles.csv and save it to your Data folder in the Pewlett-Hackard-Analysis folder.

***DB Screen Shot of Retirement Titles***
retirement_titles.png![retirement_titles](https://user-images.githubusercontent.com/82982480/121481315-9e682b80-c991-11eb-8050-d3232f725820.png)

- Copy the query from the Employee_Challenge_starter_code.sql and add it to your Employee_Database_challenge.sql file.
- Retrieve the employee number, first and last name, and title columns from the Retirement Titles table.
- These columns will be in the new table that will hold the most recent title of each employee.
- Use the DISTINCT ON statement to retrieve the first occurrence of the employee number for each set of rows defined by the ON () clause.
- Create a Unique Titles table using the INTO clause.
- Sort the Unique Titles table in ascending order by the employee number and descending order by the last date (i.e. to_date) of the most recent title.
- Export the Unique Titles table as unique_titles.csv and save it to your Data folder in the Pewlett-Hackard-Analysis folder.
- Before you export your table, confirm that it looks like this image:

***DB Screen Shot of Unique Titles***

![image](https://user-images.githubusercontent.com/82982480/121481351-a88a2a00-c991-11eb-8c6d-6ffceb334a48.png)

- Write another query in the Employee_Database_challenge.sql file to retrieve the number of employees by their most recent job title who are about to retire.
- First, retrieve the number of titles from the Unique Titles table.
- Then, create a Retiring Titles table to hold the required information.
- Group the table by title, then sort the count column in descending order.
 table as retiring_titles.csv and save it to your Data folder in the Pewlett-Hackard-Analysis folder.
- Before you export your table, confirm that it looks like this image:

***DB Screen Shot of Retiring Titles***

retiring_titles.png![retiring_titles](https://user-images.githubusercontent.com/82982480/121481385-b0e26500-c991-11eb-88c5-85ce00d6cd63.png)

***Deliverable 2:*** Mentorship Eligibility

***DB Tables***
- Employee
- Dept_Emp
- Title

***Steps of Queries:***

- Retrieve the emp_no, first_name, last_name, and birth_date columns from the Employees table.
- Retrieve the from_date and to_date columns from the Department Employee table.
- Retrieve the title column from the Titles table.
- Use a DISTINCT ON statement to retrieve the first occurrence of the employee number for each set of rows defined by the ON () clause.
- Create a new table using the INTO clause.
- Join the Employees and the Department Employee tables on the primary key.
- Join the Employees and the Titles tables on the primary key.
- Filter the data on the to_date column to all the current employees, then filter the data on the birth_date columns to get all the employees whose birth dates are between January 1, 1965 and December 31, 1965.
- Order the table by the employee number.

***DB Screen Shot of Mentorship Eligibility***

Mentorship_Eligibility.png![Mentorship_Eligibility](https://user-images.githubusercontent.com/82982480/121481425-ba6bcd00-c991-11eb-8faa-1bf921a7b775.png)

***Question 3*** A list of potential mentors who can be promoted or step-up : "Who’s Ready for a Mentor?"

***Salary Statistics of retiring employees***

- SQL Query is available in Employee_Database_Challenge.SQL document

Salary Stats.png![Salary Stats](https://user-images.githubusercontent.com/82982480/121481477-c8215280-c991-11eb-8eaa-ec224d816ca0.png)



***Conclusion:***
Looking to the number of employees who are presently eligible for retirement and also the number of mentoring employees, we can recognize that they are very hug different. The retiring employees are 33,118 and the mentoring employees are 1,549. If all retiring employees take the package services tomorrow, Pewlett Hackard company needs immediately to fill 33,118 positions. In addition, each mentor needs to train about 22 new employees (33,118/1,549 = 21.4). Let break down more in the job titles. Looking the table where the retiring employees title counts and metoring employees title counts, we can find the break down of each title category. We can spot some interesting points from the table. First, there are two manager positions in the retiring title column, but there is none in mentoring title column. Second, there are many Senior Engineer and Senior Engineer positions in the retiring title column compare to the mentoring title column. Pewlett Hackard needs to fill a lot of Senior Engineer and Senior Staff. If its business is based on Senior Engineer and Staff, it needs to make this this most important task. Pewlett Hackard aslo need to analyze the leadship manager positions. If the manager positions are critical to the Company, then it needs to find replacement for these positions.
