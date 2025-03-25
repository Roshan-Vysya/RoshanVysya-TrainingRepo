-- 1)
CREATE DATABASE CareerHub
USE CareerHub

-- 2,3,4)
--creating COMPANIES table 

CREATE TABLE Companies(
CompanyID INT IDENTITY(1000,1) PRIMARY KEY NOT NULL,
CompanyName VARCHAR(50),
Location VARCHAR(50)
)

--creating JOBS table

CREATE TABLE Jobs(
JobID INT IDENTITY(2000,1) PRIMARY KEY NOT NULL,
CompanyID INT,
JobTitle VARCHAR(50),
JobDescription VARCHAR(MAX),
JobLocation VARCHAR(50),
Salary BIGINT,
JobType VARCHAR(50),
PostedDate DATETIME,
CONSTRAINT CJ_FK FOREIGN KEY(CompanyID) REFERENCES Companies(CompanyID)
)

--creating APPLICANTS table 

CREATE TABLE Applicants(
ApplicantID INT IDENTITY(3000,1) PRIMARY KEY NOT NULL,
FirstName VARCHAR(50),
LastName VARCHAR(50),
Email VARCHAR(50),
Phone BIGINT,
Resume VARCHAR(MAX)
)

--creating APPLICATIONS table

CREATE TABLE Applications(
ApplicationID INT IDENTITY(4000,1) PRIMARY KEY NOT NULL,
JobID INT,
ApplicantID INT,
ApplicationDate DATETIME,
CoverLetter VARCHAR(MAX),
CONSTRAINT JAS_FK FOREIGN KEY(JobID) REFERENCES Jobs(JobID),
CONSTRAINT AAS_FK FOREIGN KEY(ApplicantID) REFERENCES Applicants(ApplicantID)
)

-- Insert data into Companies table
INSERT INTO Companies VALUES('Tata Consultancy Services', 'Mumbai'),
('Infosys', 'Bangalore'),
('Wipro', 'Hyderabad'),
('HCL Technologies', 'Chennai'),
('Tech Mahindra', 'Pune')

-- Insert data into Jobs table
INSERT INTO Jobs VALUES(1000, 'Software Engineer', 'Develop and maintain software solutions', 'Mumbai', 600000, 'Full-time', '2025-02-01'),
(1001, 'Data Analyst', 'Analyze datasets to generate business insights', 'Bangalore', 700000, 'Full-time', '2025-02-01'),
(1002, 'System Administrator', 'Manage IT infrastructure and ensure uptime', 'Hyderabad', 550000, 'Full-time', '2025-01-20'),
(1003, 'HR Manager', 'Oversee recruitment and employee relations', 'Chennai', 800000, 'Full-time', '2025-01-20'),
(1004, 'UI/UX Designer', 'Design intuitive user interfaces', 'Pune', 650000, 'Full-time', '2025-01-10')

-- Insert data into Applicants table
INSERT INTO Applicants VALUES('Aarav', 'Sharma', 'aarav.sharma@gmail.com', 9876543210, 'Resume_Aarav.pdf'),
('Isha', 'Kapoor', 'isha.kapoor@gmail.com', 8765432109, 'Resume_Isha.pdf'),
('Rohan', 'Mehta', 'rohan.mehta@gmail.com', 7654321098, 'Resume_Rohan.pdf'),
('Priya', 'Rao', 'priya.rao@gmail.com', 6543210987, 'Resume_Priya.pdf'),
('Aditya', 'Singh', 'aditya.singh@gmail.com', 5432109876, 'Resume_Aditya.pdf')

-- Insert data into Applications table
INSERT INTO Applications VALUES(2000, 3000, '2025-02-02', 'I am passionate about software development.'),
(2001, 3001, '2025-02-02', 'I have a strong background in data analysis.'),
(2002, 3002, '2025-01-21', 'I am experienced in managing IT infrastructure.'),
(2003, 3003, '2025-01-21', 'I have excellent interpersonal and organizational skills.'),
(2004, 3004, '2025-01-11', 'I excel at designing user-centric interfaces.')

-- 5) 
SELECT J.JobTitle, COUNT(A.ApplicationID) AS ApplicationCount
FROM Jobs as J
LEFT JOIN Applications as A
ON J.JobID = A.JobID
GROUP BY J.JobTitle

-- 6)
SELECT J.JobTitle, C.CompanyName, J.JobLocation, J.Salary
FROM Jobs as J
JOIN Companies as C
ON J.CompanyID=C.CompanyID
WHERE J.Salary BETWEEN 600000 AND 800000

-- 7)
SELECT J.JobTitle, C.CompanyName, A.ApplicationDate
FROM Applications AS A
JOIN Jobs as J ON A.JobID=J.JobID
JOIN Companies as C ON J.CompanyID=C.CompanyID
WHERE A.ApplicantID=3000

-- 8)
SELECT AVG(Salary) as AverageSalary FROM Jobs WHERE Salary>0

-- 9)
SELECT C.CompanyName, COUNT(J.JobID) as JobCounts
FROM Companies as C
JOIN Jobs as J
ON C.CompanyID=J.CompanyID
GROUP BY C.CompanyName

--10)
ALTER TABLE Applicants ADD ExperienceYears INT

UPDATE Applicants SET ExperienceYears=4

SELECT A.FirstName, A.LastName
FROM Applicants as A
JOIN Applications as AA ON A.ApplicantID=AA.ApplicantID
JOIN Jobs as J ON AA.JobID=J.JobID
JOIN Companies as C ON J.CompanyID=C.CompanyID
WHERE J.JobLocation='Chennai' AND A.ExperienceYears>3

--11)
SELECT DISTINCT JobTitle FROM Jobs WHERE Salary BETWEEN 600000 AND 800000

--12)
INSERT INTO Jobs VALUES (1004, 'Cloud Engineer', 'Responsible for managing cloud-based infrastructure and services', 'Delhi', 750000, 'Full-Time', '2025-03-01');

SELECT JobTitle FROM Jobs WHERE JobID NOT IN(SELECT JobID FROM Applications)

--13)
SELECT A.FirstName, A.LastName, C.CompanyName, J.JobTitle
FROM Applicants as A
JOIN Applications as AA ON A.ApplicantID=AA.ApplicantID
JOIN Jobs as J ON AA.JobID=J.JobID
JOIN Companies as C ON J.CompanyID=C.CompanyID

--14)
SELECT C.CompanyName, COUNT(J.JobID) as CountOfJobs
FROM Jobs as J
LEFT JOIN Companies as C
ON J.CompanyID=C.CompanyID
GROUP BY C.CompanyName

--15)
SELECT A.ApplicantID,A.FirstName,A.LastName,C.CompanyName,J.JobTitle
FROM Applicants as A
LEFT JOIN Applications as AP ON A.ApplicantID = AP.ApplicantID
JOIN Jobs as J ON AP.JobID = J.JobID
JOIN Companies C ON J.CompanyID = C.CompanyID;

--16)
SELECT CompanyName FROM Companies WHERE CompanyID IN(SELECT CompanyID FROM Jobs WHERE Salary>(SELECT AVG(Salary) FROM Jobs))
--or by using joins
--17)
ALTER table Applicants ADD City VARCHAR(50), State VARCHAR(50)

UPDATE Applicants
SET City = 'Mumbai', State = 'Maharashtra'
WHERE ApplicantID = 3000;

UPDATE Applicants
SET City = 'Bangalore', State = 'Karnataka'
WHERE ApplicantID = 3001;

UPDATE Applicants
SET City = 'Delhi', State = 'Delhi'
WHERE ApplicantID = 3002;

SELECT ApplicantID, FirstName, LastName,CONCAT(City, ', ', State) AS Location FROM Applicants

--18)
SELECT JobTitle FROM Jobs WHERE JobTitle LIKE '%Developer%' OR JobTitle LIKE '%Engineer%'

--19)
SELECT A.ApplicantID,A.FirstName, A.LastName,J.JobTitle
FROM Applicants A
FULL OUTER JOIN Applications AP ON A.ApplicantID = AP.ApplicantID
JOIN Jobs J ON AP.JobID = J.JobID

--20)
SELECT A.ApplicantID, A.FirstName, A.LastName, C.CompanyName, C.Location
FROM Applicants A
CROSS JOIN Companies C
WHERE C.Location = 'Chennai' AND A.ExperienceYears > 2






