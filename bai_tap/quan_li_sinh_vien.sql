CREATE DATABASE quan_li_sinh_vien;
USE quan_li_sinh_vien;

create table class(
class_id int primary key,
class_name varchar(20),
stardate date,
`status` bit
);

create table student(
student_id int primary key,
student_name varchar(45),
address varchar(45),
phone varchar(45),
`status` bit,
class_id int,
foreign key(class_id) references class(class_id)  
);

create table subjects(
sub_id int primary key,
sub_name varchar(20),
credit int,
`status` bit
);

create table mark(
mark_id int auto_increment primary key,
sub_id int,
student_id int,
mark int,
exam_times time,
foreign key( sub_id) references subjects(sub_id),
foreign key( student_id) references student(student_id)
);

insert into class(class_id, class_name,stardate,`status`)
values (1, 'A1', '2008-12-20', 1),
(2, 'A2', '2008-12-22', 1),
(3, 'B3', current_date, 0);

insert into student(student_name, address, phone, `status`, class_id)
values('Hung', 'Ha Noi', '0912113113', 1, 1),
('Hoa', 'Hai phong',null, 1, 1),
('Manh', 'HCM', '0123123123', 0, 2);

insert into subjects(sub_id, sub_name,credit, `status`)
values(1, 'CF', 5, 1),
       (2, 'C', 6, 1),
       (3, 'HDJ', 5, 1),
       (4, 'RDBMS', 10, 1);
       
insert into mark(sub_id, student_id, mark,exam_times)
values (1, 1, 8, 1),
       (1, 2, 10, 2),
       (2, 1, 12, 1); 
       
select * from student where student_name like 'H%';

select * from class where stardate like '%12%';

select * from subjects where credit between 3 and 5;

set SQL_SAFE_UPDATES = 0;
update student set class_id = 2 where student_name = "hung";

select student.student_name, subjects.sub_name, mark.mark 
from student
join mark on  mark.student_id = student.student_id
join subjects on  mark.sub_id = subjects.sub_id;