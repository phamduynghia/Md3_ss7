create table students(
studentId int primary key auto_increment,
studentName varchar(50),
age int not null,
email varchar(100) not null
);

create table subjects(
subjectId int primary key auto_increment,
subjectName varchar(50) not null
);

create table class(
classId int primary key auto_increment,
className varchar(50) not null
);

create table marks(
subject_id int not null,
foreign key (subject_id) references subjects(subjectId),
student_id int not null,
foreign key (student_id) references students(studentId),
mark int not null
);

create table classStudent(
studentId int not null,
foreign key (studentId) references students(studentId),
classId int not null,
foreign key (classId) references class(classId)
);

insert into students values (1,'Nguyen Quang An',18,'an@yahoo.com'),
(2,'Nguyen Cong Vinh',20,'vinh@gmail.com'),(3,'Nguyen Van Quyen',19,'quyen'),
(4,'Pham Thanh Binh',25,'binh@com'),(5,'Nguyen Van Tai Em',30,'taiem@sport.vn');

insert into class values (1,'C0706L'),(2,'C0708G');
insert into classStudent values(1,1),(2,1),(3,2),(4,2),(5,2),(5,1);
insert into subjects values(1,'SQL'),(2,'Java'),(3,'c'),(4,'Visual Basic');
insert into marks(mark,subject_id,student_id) values(8,1,1),(4,2,1),(9,1,1),(7,1,3),(3,1,4),(5,2,5),(8,3,3),(1,3,5),(3,2,4);

select * from students;

select * from subjects;

select student_id,avg(mark) as 'diem_trung_binh'
from marks 
 group by student_id;
 
 select subjects.subjectName
 from marks 
 join subjects  on marks.subject_id = subjects.subjectId
 where marks.mark > 9;
 
 select student_id, avg(mark) as 'diem_trungbinh' from marks
 group by student_id order by 'diem_trungbinh' desc;
 
 update subjects 
 set subjectName = concat('Day la mon hoc',subjectName);
 select * from subjects;
 
 delimiter $$
 create trigger check_age
 before insert on students
 for each row
 begin
 if new.age <= 15 or new.age >=50 then
 signal sqlstate '45000'
 set message_text = 'Age must be between 15 and 50';
 end if;
 end$$
 select * from students;
 insert into students values (6,'Nguyen Quang binh',16,'binh@yahoo.com');
 
 alter table classstudent drop constraint classstudent_ibfk_1;
 alter table classStudent drop constraint classstudent_ibfk_2;
 
 alter table marks drop constraint marks_ibfk_2; 
 alter table marks drop constraint marks_ibfk_1; 
 
 delete from students where studentId = 1;
 
 alter table students add status bit default 1;
 
 update students set status = 0;
 select * from students;