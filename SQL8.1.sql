# Dt-23/05/23 CS

create database medical_case;
use medical_case;


create table patients
(patientID int auto_increment,
Fname varchar(50),
age int,

primary key(patientID)
);

create table visits
(visitID int auto_increment,
vpatientID int,
visitdate date,

primary key(visitId),

constraint viid
foreign key(vpatientID) references patients(patientID)
on update cascade on delete set null
);


create table medications
(visitID int,
medication varchar(100),
meddate date,

constraint miid
foreign key(visitID) references visits(visitID)
on update cascade on delete set null
);



create table vitals
(visitid int,
systolic int,
diastolic int,

constraint vaid
foreign key(visitid) references visits(visitID)
on update cascade on delete set null
);

create table aes
(visitID int,
AE varchar(50),
medication varchar(100),

constraint agid
foreign key(visitId) references visits(visitId)
on update cascade on delete set null
);




# data insertion:

# patients

insert into patients(Fname,age) values('Joy',25),('jane',26),('frank',28),('john',22),('David',26),('Amelia',21),
('peter',20),('saksham',26),('ross',32);

#visits
insert into visits(VpatientID,visitdate) values(1,'2018-01-06'),(2,'2018-02-17'),(3,'2018-03-17'),(1,'2018-03-18')
,(5,'2019-03-17'),(6,'2018-03-21'),(8,'2018-08-22'),(4,'2020-03-17'),(7,'2018-02-10'),(9,'2018-09-17'),(5,'2019-08-17'),
(6,'2018-03-07');

# vitals
insert into vitals values(1, 120, 80),
(2, 125, 84),
(3, 130, 90),
(4, 145, 101),
(5, 139, 96),
(6, 142, 97),
(7, 145, 100),(8,154,102),(9,135,100),(10,120,98),(11,150,90),(12,155,112);

#aes

Insert into aes (VisitID, AE, medication) values(1, 'Headache', 'Asprin');
Insert into aes (VisitID, AE) values (1, 'Nausea');
Insert into aes (VisitID, AE, medication) values (3, 'Headache', 'Tylenol');
Insert into aes (VisitID, AE) values (4, 'High BP');
Insert into aes (VisitID, AE, medication) values (4, 'Heartburn', 'Zantac');
Insert into aes (VisitID, AE, medication) values (7, 'High BP', 'Norvasc');
Insert into aes (VisitID, AE, medication) values(2,'Low BP','Norvasc');
Insert into aes (VisitID, AE, medication) values(5,'Fever','Dolo-65');
Insert into aes (VisitID, AE, medication) values(6,'Fever','crocin');
Insert into aes (VisitID, AE, medication) values(8,'Headache','Vicks-500');
Insert into aes (VisitID, AE) values(9,'High BP');
Insert into aes (VisitID, AE) values(10,'Dental');
Insert into aes (VisitID, AE, medication) values(11,'Low BP','Norvasc');
Insert into aes (VisitID, AE, medication) values(12,'heartburn','Zantac');

# medication

Insert into medications(VisitID, medication, meddate) Values (1, 'Asprin', '2018-02-17');
Insert into medications(VisitID, medication, meddate) Values (2, 'Tylenol', '2018-02-17');
Insert into medications(VisitID, medication, meddate) Values (3, 'Zantac', '2018-03-17');
Insert into medications(VisitID, medication, meddate) Values (4, 'Aleve', '2018-03-18');
Insert into medications(VisitID, medication, meddate)Values (5, 'Dolo', '2019-03-17');
Insert into medications(VisitID, medication, meddate) Values (6, 'Tylenol', '2018-03-21');
Insert into medications(VisitID, medication, meddate) Values (7, 'Zantac', '2018-08-22');
Insert into medications(VisitID, medication, meddate)Values (8, 'Aleve', '2018-08-22');
Insert into medications(VisitID, medication, meddate) Values (9, 'Dolo', '2019-08-22');
Insert into medications(VisitID, medication, meddate)  Values (10, 'Aleve', '2019-08-17');
Insert into medications(VisitID, medication, meddate) Values (11, 'Zantac', '2019-08-17');
Insert into medications(VisitID, medication, meddate) Values (12, 'Dolo', '2018-03-07');


select * from patients;
select * from visits;
select * from vitals;
select * from aes;
select * from medications;

