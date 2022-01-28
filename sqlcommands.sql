create database school1;
use school1;

-- Ahmed Ali
create table medical_clinic(
visit_id int primary key,
person_id char(10) not null,
doctor_id char(10) not null,
visit_date date not null,
prescription varchar(20)

);
CREATE TABLE grades(
student_id CHAR(10) not null,
course_id CHAR(10) not null,
grade INTEGER not null,
great_mark INTEGER not null,
min_grade INTEGER not null

,PRIMARY KEY(student_id,course_id)
);
CREATE TABLE absences(
absence_id CHAR(10) PRIMARY KEY,
person_id CHAR(10) not null,
absence_date DATE not null,
cause VARCHAR(20) 

);
CREATE TABLE punchments(
punchment_id CHAR(10) PRIMARY KEY,
person_id CHAR(10) not null,
punchment_date DATE not null,
cause VARCHAR(20) not null

);
create table depends_on(


student_id char(10) ,
teacher_id  char(10)
,PRIMARY KEY(student_id,teacher_id));

-- Obada yahia
create table person(
person_id char(10) primary key,
first_name varchar(20) not null,
minit char not null,
last_name varchar(20) not null,
gender char not null);

alter table person modify gender char check (gender in('f','m'));

create table employees(
employee_id char(10) primary key,
salary decimal(6,2) check (salary>582),
certificate varchar(25),
experiance_years integer );
-- comment
create table teacher(
teacher_id char(10) primary key,
major varchar(20) not null,
F_P_time char check (F_P_time  in ('F','P'))

);
create table non_educationl_employees(
non_edu_id char(10) primary key,
job_title varchar(10) check 
(job_title in ('doctor','Clean Worker','Social advisor','manager','IT proficient','cafeteria worker','secretaria','Librarian')));
create table student(
student_id char(10) primary key,
parent_phone char(10),
section_id char(5) not null,
class_level char(5) not null);

-- omar hantouli

create table teach(
teacher_id char(10),
course_id char(5),
section_id char(5),
primary key(teacher_id, course_id, section_id)
);
create table graduated_from(
student_id char(10),
class_level char(5),
the_year year not null,
primary key(student_id, class_level,the_year));
create table library_books(
book_id char(5) primary key,
title varchar(20) not null,
edition varchar(20) not null,
author varchar(20) not null,
is_borrowed bool not null);

-- moahmmed zyoud 

create table course(
course_id char(5),
class_level char(3) not null,
subject varchar(15) not null,
primary key(course_id)
);
create table class(
class_level char(3),
fees integer not null,
primary key(class_level)

);
create table section(
section_id char(5),
room_no char(5) not null,
primary key(section_id)
);
create table room(
room_no char(5),
capacity integer not null,
role_of_room varchar(20) not null ,
primary key(room_no)
);
create table borrow(
borrow_id char(5),
person_id char(5) not null,
book_id char(5) not null,
date_of_borrowing date not null,
date_of_return date not null,
is_it_returned bool not null,
primary key(borrow_id)
);

-- referitial constraints 
alter table employees add (constraint 
employee_person foreign key (employee_id) references person(person_id));

alter table teacher add (constraint 
teacher_person foreign key (teacher_id) references employees(employee_id));

alter table non_educationl_employees add (constraint 
non_edu_employees foreign key (non_edu_id) references employees(employee_id));

alter table student add (constraint 
student_person foreign key (student_id) references person(person_id));

alter table student add (constraint 
student_section foreign key (section_id) references section(section_id));

alter table student add (constraint 
student_class foreign key (class_level) references class(class_level));

alter table  absences add(constraint 
absences_person  foreign key (person_id) references person(person_id)
);

alter table  punchments add(constraint 
punchments_person  foreign key (person_id) references person(person_id)
);

alter table  depends_on add(constraint 
depends_on_student  foreign key (student_id) references student(student_id)
);

alter table  depends_on add(constraint 
depends_on_teacher  foreign key (teacher_id) references teacher(teacher_id)
);

alter table  medical_clinic add(constraint 
medical_clinic_person  foreign key (person_id) references person (person_id)
);

alter table  medical_clinic add(constraint 
medical_clinic_doctor  foreign key (doctor_id) references non_educationl_employees (non_edu_id)
);


alter table  grades add(constraint 
grades_student  foreign key (student_id) references student(student_id)
);

alter table  grades add(constraint 
grades_course  foreign key (course_id) references course(course_id)
);

-- omar constraints
 
alter table teach add (constraint 
teach_teacher foreign key (teacher_id) references teacher(teacher_id),
constraint 
teach_section foreign key (section_id) references section(section_id)
);

alter table graduated_from add (constraint 
graduated_from_student foreign key (student_id) references student(student_id));

alter table graduated_from add (constraint 
graduated_from_class foreign key (class_level) references class(class_level));

alter table course add (constraint 
course_class foreign key (class_level) references class(class_level));

alter table section add (constraint 
section_room foreign key (room_no) references room(room_no));

alter table borrow add (constraint 
borrow_library_books foreign key (book_id) references library_books(book_id));

insert into person values ('158452455','mohammed','m','zyoud','m');
select * from person;

insert into employees values('158452455',5000,'phd',55);
insert into teacher values('158452455','computer engineering','F');
insert into student values ('158452455','0592531240','11111','first');
delete  from student where student_id = '158452455';
select * from teacher;