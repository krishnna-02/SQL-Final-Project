create database finalpr;
use finalpr;

CREATE TABLE Students(
    StudID INT PRIMARY KEY,
    FirstName VARCHAR(20),
    LastName VARCHAR(20),
    Email VARCHAR(25),
    BirthDate DATE,
    EnrollmentDate DATE
);
INSERT INTO Students VALUES (1, 'Amit', 'Sharma', 'amit.sharma@gmail.com', '2002-05-14', '2021-07-01');
INSERT INTO Students VALUES (2, 'Priya', 'Patel', 'priya.patel@gmail.com','2001-08-22','2020-07-01');
INSERT INTO Students VALUES (3, 'Rahul', 'Verma', 'rahul.verma@gmail.com', '2003-01-10','2022-07-01');
INSERT INTO Students VALUES (4, 'Sneha', 'Iyer', 'sneha.iyer@gmail.com','2002-11-05','2021-07-01');
INSERT INTO Students VALUES (5, 'Karan', 'Mehta', 'karan.mehta@gmail.com', '2000-03-18','2019-07-01');

 select *from Students;
+--------+-----------+----------+-----------------------+------------+----------------+
| StudID | FirstName | LastName | Email                 | BirthDate  | EnrollmentDate |
+--------+-----------+----------+-----------------------+------------+----------------+
|      1 | Amit      | Sharma   | amit.sharma@gmail.com | 2002-05-14 | 2021-07-01     |
|      2 | Priya     | Patel    | priya.patel@gmail.com | 2001-08-22 | 2020-07-01     |
|      3 | Rahul     | Verma    | rahul.verma@gmail.com | 2003-01-10 | 2022-07-01     |
|      4 | Sneha     | Iyer     | sneha.iyer@gmail.com  | 2002-11-05 | 2021-07-01     |
|      5 | Karan     | Mehta    | karan.mehta@gmail.com | 2000-03-18 | 2019-07-01     |
+--------+-----------+----------+-----------------------+------------+----------------+



CREATE TABLE Departments(
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(30)
);

INSERT INTO Departments VALUES (1, 'Computer Science');
INSERT INTO Departments VALUES (2, 'Information Technology');
INSERT INTO Departments VALUES (3, 'Mechanical Engineering');
INSERT INTO Departments VALUES (4, 'Electrical Engineering');
INSERT INTO Departments VALUES (5, 'Civil Engineering');

select *from Departments;
+--------------+------------------------+
| DepartmentID | DepartmentName         |
+--------------+------------------------+
|            1 | Computer Science       |
|            2 | Information Technology |
|            3 | Mechanical Engineering |
|            4 | Electrical Engineering |
|            5 | Civil Engineering      |
+--------------+------------------------+


CREATE TABLE Courses(
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(40),
    DepartmentID INT,
    Credits INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

INSERT INTO Courses VALUES (101, 'Database Management System', 1, 4);
INSERT INTO Courses VALUES (102, 'Operating Systems', 1, 4);
INSERT INTO Courses VALUES (103, 'Data Structures', 2, 3);
INSERT INTO Courses VALUES (104, 'Thermodynamics', 3, 4);
INSERT INTO Courses VALUES (105, 'Circuit Theory', 4, 3);


 select *from Courses;
+----------+----------------------------+--------------+---------+
| CourseID | CourseName                 | DepartmentID | Credits |
+----------+----------------------------+--------------+---------+
|      101 | Database Management System |            1 |       4 |
|      102 | Operating Systems          |            1 |       4 |
|      103 | Data Structures            |            2 |       3 |
|      104 | Thermodynamics             |            3 |       4 |
|      105 | Circuit Theory             |            4 |       3 |

CREATE TABLE Instructors(
    InstructorID INT PRIMARY KEY,
    FirstName VARCHAR(20),
    LastName VARCHAR(15),
    Email VARCHAR(25),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

INSERT INTO Instructors VALUES (1, 'Rajesh', 'Kumar', 'rajesh.kumar@gmail.com', 1);
INSERT INTO Instructors VALUES (2, 'Neha', 'Shah', 'neha.shah@gmail.com', 2);
INSERT INTO Instructors VALUES (3, 'Vikram', 'Singh', 'vikram.singh@gmail.com', 3);
INSERT INTO Instructors VALUES (4, 'Anjali', 'Desai', 'anjali.desai@gmail.com', 4);
INSERT INTO Instructors VALUES (5, 'Suresh', 'Reddy', 'suresh.reddy@gmail.com', 5);

select *from Instructors;
+--------------+-----------+----------+------------------------+--------------+
| InstructorID | FirstName | LastName | Email                  | DepartmentID |
+--------------+-----------+----------+------------------------+--------------+
|            1 | Rajesh    | Kumar    | rajesh.kumar@gmail.com |            1 |
|            2 | Neha      | Shah     | neha.shah@gmail.com    |            2 |
|            3 | Vikram    | Singh    | vikram.singh@gmail.com |            3 |
|            4 | Anjali    | Desai    | anjali.desai@gmail.com |            4 |
|            5 | Suresh    | Reddy    | suresh.reddy@gmail.com |            5 |
+--------------+-----------+----------+------------------------+--------------+


CREATE TABLE Enrollments(
    EnrollmentID INT PRIMARY KEY,
    StudID INT,
    CourseID INT,
    EnrollmentDate DATE,
    FOREIGN KEY (StudID) REFERENCES Students(StudID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

INSERT INTO Enrollments VALUES (1, 1, 101, DATE '2021-07-10');
INSERT INTO Enrollments VALUES (2, 2, 102, DATE '2020-07-12');
INSERT INTO Enrollments VALUES (3, 3, 103, DATE '2022-07-15');
INSERT INTO Enrollments VALUES (4, 4, 104, DATE '2021-07-18');
INSERT INTO Enrollments VALUES (5, 5, 105, DATE '2019-07-20');

select  *from Enrollments;
+--------------+--------+----------+----------------+
| EnrollmentID | StudID | CourseID | EnrollmentDate |
+--------------+--------+----------+----------------+
|            1 |      1 |      101 | 2021-07-10     |
|            2 |      2 |      102 | 2020-07-12     |
|            3 |      3 |      103 | 2022-07-15     |
|            4 |      4 |      104 | 2021-07-18     |
|            5 |      5 |      105 | 2019-07-20     |
+--------------+--------+----------+----------------+


1.
INSERT INTO Students VALUES (6, 'Rohit', 'Joshi', 'rohit.joshi@gmail.com', DATE '2002-09-10', DATE '2021-07-01');
Query OK, 1 row affected (0.081 sec)

mysql> UPDATE Students
    -> SET Email = 'amit.new@gmail.com'
    -> WHERE StudID = 1;
Query OK, 1 row affected (0.194 sec)

mysql> DELETE FROM Students
    -> WHERE StudID = 6;
Query OK, 1 row affected (0.175 sec)

mysql> SELECT * FROM Students;
+--------+-----------+----------+-----------------------+------------+----------------+
| StudID | FirstName | LastName | Email                 | BirthDate  | EnrollmentDate |
+--------+-----------+----------+-----------------------+------------+----------------+
|      1 | Amit      | Sharma   | amit.new@gmail.com    | 2002-05-14 | 2021-07-01     |
|      2 | Priya     | Patel    | priya.patel@gmail.com | 2001-08-22 | 2020-07-01     |
|      3 | Rahul     | Verma    | rahul.verma@gmail.com | 2003-01-10 | 2022-07-01     |
|      4 | Sneha     | Iyer     | sneha.iyer@gmail.com  | 2002-11-05 | 2021-07-01     |
|      5 | Karan     | Mehta    | karan.mehta@gmail.com | 2000-03-18 | 2019-07-01     |
+--------+-----------+----------+-----------------------+------------+----------------+

2.
 SELECT *
    -> FROM Students
    -> WHERE EnrollmentDate > DATE '2022-01-01';
+--------+-----------+----------+-----------------------+------------+----------------+
| StudID | FirstName | LastName | Email                 | BirthDate  | EnrollmentDate |
+--------+-----------+----------+-----------------------+------------+----------------+
|      3 | Rahul     | Verma    | rahul.verma@gmail.com | 2003-01-10 | 2022-07-01     |
+--------+-----------+----------+-----------------------+------------+----------------+


3.
SELECT *
    -> FROM Courses
    -> WHERE DepartmentID = (
    ->     SELECT DepartmentID
    ->     FROM Departments
    ->     WHERE DepartmentName = 'Mathematics'
    -> )
    -> ;
Empty set (0.016 sec)

4.
 SELECT CourseID, COUNT(StudID) AS TotalStudents
    -> FROM Enrollments
    -> GROUP BY CourseID
    -> HAVING COUNT(StudID) > 5;
Empty set (0.018 sec)

5.
SELECT StudID
    -> FROM Enrollments
    -> WHERE CourseID IN (
    ->     SELECT CourseID FROM Courses
    ->     WHERE CourseName IN ('Introduction to SQL', 'Data Structures')
    -> )
    -> GROUP BY StudID
    -> HAVING COUNT(DISTINCT CourseID) = 2;
Empty set (0.062 sec)

6.
mysql> SELECT DISTINCT StudID
    -> FROM Enrollments
    -> WHERE CourseID IN (
    ->     SELECT CourseID FROM Courses
    ->     WHERE CourseName IN ('Introduction to SQL', 'Data Structures')
    -> );
+--------+
| StudID |
+--------+
|      3 |
+--------+

7.

mysql> SELECT AVG(Credits) AS AverageCredits
    -> FROM Courses;
+----------------+
| AverageCredits |
+----------------+
|         3.6000 |
+----------------+

8.



9.
SELECT COUNT(*)
    -> FROM Enrollments
    -> WHERE CourseID IN (
    ->     SELECT CourseID
    ->     FROM Enrollments
    ->     GROUP BY CourseID
    ->     HAVING COUNT(StudID) > 10
    -> );
+----------+
| COUNT(*) |
+----------+
|        0 |
+----------+

10.
mysql> SELECT s.FirstName, s.LastName, c.CourseName
    -> FROM Students s
    -> INNER JOIN Enrollments e ON s.StudID = e.StudID
    -> INNER JOIN Courses c ON e.CourseID = c.CourseID;
+-----------+----------+----------------------------+
| FirstName | LastName | CourseName                 |
+-----------+----------+----------------------------+
| Amit      | Sharma   | Database Management System |
| Priya     | Patel    | Operating Systems          |
| Rahul     | Verma    | Data Structures            |
| Sneha     | Iyer     | Thermodynamics             |
| Karan     | Mehta    | Circuit Theory             |
+-----------+----------+----------------------------+

11.
SELECT s.FirstName, c.CourseName FROM Students s
    -> LEFT JOIN Enrollments e ON s.StudID = e.StudID
    -> LEFT JOIN Courses c ON e.CourseID = c.CourseID;
+-----------+----------------------------+
| FirstName | CourseName                 |
+-----------+----------------------------+
| Amit      | Database Management System |
| Priya     | Operating Systems          |
| Rahul     | Data Structures            |
| Sneha     | Thermodynamics             |
| Karan     | Circuit Theory             |
+-----------+----------------------------+

12.
SELECT * FROM Students
    -> WHERE StudID IN (SELECT StudID FROM Enrollments
    ->     WHERE CourseID IN (SELECT CourseID FROM Enrollments
    ->         GROUP BY CourseID
    ->         HAVING COUNT(StudID) > 10)
    -> );
Empty set (0.118 sec)

13.

mysql> SELECT StudID, YEAR(EnrollmentDate) as YEAR
    -> FROM Students;
+--------+------+
| StudID | YEAR |
+--------+------+
|      1 | 2021 |
|      2 | 2020 |
|      3 | 2022 |
|      4 | 2021 |
|      5 | 2019 |
+--------+------+

14.
SELECT FirstName,LastName, CONCAT(FirstName,' ',LastName) as Full_name
    -> FROM Instructors;
+-----------+----------+--------------+
| FirstName | LastName | Full_name    |
+-----------+----------+--------------+
| Rajesh    | Kumar    | Rajesh Kumar |
| Neha      | Shah     | Neha Shah    |
| Vikram    | Singh    | Vikram Singh |
| Anjali    | Desai    | Anjali Desai |
| Suresh    | Reddy    | Suresh Reddy |
+-----------+----------+--------------+

15.
 SELECT CourseID,
    -> COUNT(StudID) OVER (ORDER BY CourseID) as Running_Total
    -> FROM Enrollments;
+----------+---------------+
| CourseID | Running_Total |
+----------+---------------+
|      101 |             1 |
|      102 |             2 |
|      103 |             3 |
|      104 |             4 |
|      105 |             5 |
+----------+---------------+
5 rows in set (0.017 sec)

16.
 SELECT  StudID,FirstName,EnrollmentDate,
    -> CASE
    ->     WHEN YEAR(CURDATE()) - YEAR(EnrollmentDate) > 4 THEN 'Senior'
    ->     ELSE 'Junior'
    -> END AS Status
    -> FROM Students;
+--------+-----------+----------------+--------+
| StudID | FirstName | EnrollmentDate | Status |
+--------+-----------+----------------+--------+
|      1 | Amit      | 2021-07-01     | Senior |
|      2 | Priya     | 2020-07-01     | Senior |
|      3 | Rahul     | 2022-07-01     | Junior |
|      4 | Sneha     | 2021-07-01     | Senior |
|      5 | Karan     | 2019-07-01     | Senior |
+--------+-----------+----------------+--------+


