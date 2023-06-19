create database studentsTable;
use studentsTable;
CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    Namess VARCHAR(40),
    Address VARCHAR(40),
    DeptID INT
);

CREATE TABLE Grade (
    StudentID INT,
    CourseID INT,
    Grade VARCHAR(2),
    Points INT,
    PRIMARY KEY (StudentID, CourseID)
);

CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(40),
    Credits INT,
    DeptID INT
);
select * from Student,Grade,Course,StudentEnrollment,CourseRegistration,Department,Faculty,FacultyCoursePreferences;
CREATE TABLE StudentEnrollment (
    StudentID INT,
    DeptID INT,
    StartDate DATE,
    EmergencyContact VARCHAR(40),
    PRIMARY KEY (StudentID, DeptID)
);

CREATE TABLE CourseRegistration (
    CourseID INT,
    StudentID INT,
    FacultyID INT,
    StartDate DATE,
    EndDate DATE,
    PRIMARY KEY (CourseID, StudentID)
);
select * from Student,Grade,Course,StudentEnrollment,CourseRegistration,Department,Faculty,FacultyCoursePreferences;

CREATE TABLE Department (
    DeptID INT PRIMARY KEY,
    Namess VARCHAR(40),
    Head VARCHAR(40)
);

CREATE TABLE Faculty (
    FacultyID INT PRIMARY KEY,
    Namess VARCHAR(40),
    Address VARCHAR(40),
    DeptID INT
);

CREATE TABLE FacultyCoursePreferences (
    FacultyID INT,
    CourseID INT,
    PRIMARY KEY (FacultyID, CourseID)
);

-- Sample data for Student table
INSERT INTO Student (StudentID, Namess, Address, DeptID)
VALUES (1, 'John Doe', '123 Main St', 1),
       (2, 'Jane Smith', '456 Elm St', 2),
       (3, 'David Johnson', '789 Oak St', 1),
       (4, 'Sarah Wilson', '321 Pine St', 2),
       (5, 'Michael Brown', '654 Maple St', 3);

-- Sample data for Grade table
INSERT INTO Grade (StudentID, CourseID, Grade, Points)
VALUES (1, 1, 'A', 90),
       (1, 2, 'B', 80),
       (2, 1, 'B+', 85),
       (2, 3, 'A-', 88),
       (3, 2, 'C', 70);
select * from Student,Grade,Course,StudentEnrollment,CourseRegistration,Department,Faculty,FacultyCoursePreferences;

-- Sample data for Course table
INSERT INTO Course (CourseID, CourseName, Credits, DeptID)
VALUES (1, 'Mathematics', 3, 1),
       (2, 'English', 4, 2),
       (3, 'Science', 3, 3),
       (4, 'History', 3, 2),
       (5, 'Computer Science', 4, 1);

-- Sample data for StudentEnrollment table
INSERT INTO StudentEnrollment (StudentID, DeptID, StartDate, EmergencyContact)
VALUES (1, 1, '2022-08-01', 'John Contact'),
       (2, 2, '2022-08-01', 'Jane Contact'),
       (3, 1, '2022-08-01', 'David Contact'),
       (4, 2, '2022-08-01', 'Sarah Contact'),
       (5, 3, '2022-08-01', 'Michael Contact');

-- Sample data for CourseRegistration table
INSERT INTO CourseRegistration (CourseID, StudentID, FacultyID, StartDate, EndDate)
VALUES (1, 1, 1, '2022-08-01', '2022-12-15'),
       (2, 1, 2, '2022-08-01', '2022-12-15'),
       (1, 2, 1, '2022-08-01', '2022-12-15'),
       (3, 2, 3, '2022-08-01', '2022-12-15'),
       (2, 3, 2, '2022-08-01', '2022-12-15');

-- Sample data for Department table
INSERT INTO Department (DeptID, Namess, Head)
VALUES (1, 'Mathematics Department', 'John Head'),
       (2, 'English Department', 'Jane Head'),
       (3, 'Science Department', 'David Head');

-- Sample data for Faculty table
INSERT INTO Faculty (FacultyID, Namess, Address, DeptID)
VALUES (1, 'Professor Smith', '111 University St', 1),
       (2, 'Professor Johnson', '222 University St', 2),
       (3, 'Professor Wilson', '333 University St', 3);
select * from Student,Grade,Course,StudentEnrollment,CourseRegistration,Department,Faculty,FacultyCoursePreferences;

-- Sample data for FacultyCoursePreferences table
INSERT INTO FacultyCoursePreferences (FacultyID, CourseID)
VALUES (1, 1),
       (1, 2),
       (2, 2),
       (3, 3),
       (3, 4);

-- 1. Max, Min, Avg Grade of Student:
SELECT StudentID, MAX(Grade) AS MaxGrade, MIN(Grade) AS MinGrade, AVG(Points) AS AvgGrade
FROM Grade
GROUP BY StudentID;


-- 2. Top/Bottom student details in univ


-- Top student details
SELECT s.StudentID, s.Namess
FROM Student s
JOIN Grade g ON s.StudentID = g.StudentID
GROUP BY s.StudentID, s.Namess
HAVING SUM(g.Points) = (
    SELECT MAX(total_points)
    FROM (
        SELECT StudentID, SUM(Points) AS total_points
        FROM Grade
        GROUP BY StudentID
    ) AS total_points_table
);

-- Bottom student details
SELECT s.StudentID, s.Namess
FROM Student s
JOIN Grade g ON s.StudentID = g.StudentID
GROUP BY s.StudentID, s.Namess
HAVING SUM(g.Points) = (
    SELECT MIN(total_points)
    FROM (
        SELECT StudentID, SUM(Points) AS total_points
        FROM Grade
        GROUP BY StudentID
    ) AS total_points_table
);
-- 3.Top/bottom 3 students in Univ or per department:
 -- Top 3 students in Univ
SELECT s.StudentID, s.Namess
FROM Student s
JOIN Grade g ON s.StudentID = g.StudentID
GROUP BY s.StudentID, s.Namess
ORDER BY SUM(g.Points) DESC
LIMIT 3;

-- Bottom 3 students in Univ
SELECT s.StudentID, s.Namess
FROM Student s
JOIN Grade g ON s.StudentID = g.StudentID
GROUP BY s.StudentID, s.Namess
ORDER BY SUM(g.Points) ASC
LIMIT 3;

-- Top 3 students per department
SELECT s.StudentID, s.Name
FROM Student s
JOIN Grade g ON s.StudentID = g.StudentID
WHERE s.DeptID = DepartmentID GROUP BY s.StudentID, s.Name
ORDER BY SUM(g.Points) DESC
LIMIT 3;

-- Bottom 3 students per department
SELECT s.StudentID, s.Name
FROM Student s
JOIN Grade g ON s.StudentID = g.StudentID
WHERE s.DeptID = DepartmentID
GROUP BY s.StudentID, s.Name
ORDER BY SUM(g.Points) ASC
LIMIT 3;




-- 4. All the top/bottom/avg students in each department:
-- Top student in each department
SELECT s.DeptID, s.StudentID, s.Name
FROM Student s
JOIN Grade g ON s.StudentID = g.StudentID
GROUP BY s.DeptID, s.StudentID, s.Name
HAVING SUM(g.Points) = (
    SELECT MAX(total_points)
    FROM (
        SELECT StudentID, SUM(Points) AS total_points
        FROM Grade
        GROUP BY StudentID
    ) AS total_points_table
    WHERE StudentID = s.StudentID
);

-- Bottom student in each department
SELECT s.DeptID, s.StudentID, s.Name
FROM Student s
JOIN Grade g ON s.StudentID = g.StudentID
GROUP BY s.DeptID, s.StudentID, s.Name
HAVING SUM(g.Points) = (
    SELECT MIN(total_points)
    FROM (
        SELECT StudentID, SUM(Points) AS total_points
        FROM Grade
        GROUP BY StudentID
    ) AS total_points_table
    WHERE StudentID = s.StudentID
);

-- Average student in each department
SELECT s.DeptID, s.StudentID, s.Name
FROM Student s
JOIN Grade g ON s.StudentID = g.StudentID
GROUP BY s.DeptID, s.StudentID, s.Name
HAVING AVG(g.Points) = (
    SELECT AVG(total_points)
    FROM (
        SELECT StudentID, AVG(Points) AS total_points
        FROM Grade
        GROUP BY StudentID
    ) AS total_points_table
    WHERE StudentID = s.StudentID
);

