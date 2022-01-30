create database school1;
use school1;
-- hello world
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
F_P_time char check (F_P_time  in ('f','p'))

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
the_year number(4) not null,
primary key(student_id, class_level,the_year));
create table library_books(
book_id char(5) primary key,
title varchar(20) not null,
edition varchar(20) not null,
author varchar(20) not null,
is_borrowed char not null check(is_borrowed in ('t','f')));

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
is_it_returned char not null check(is_it_returned in ('f','t')),
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
alter table teach add(constraint
teach_course foreign key(course_id) references course(course_id));

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


/// inserted into school
#insert into person values ('0123456789','ahmad','m','mostufa','m');
insert into person values ('1112223333','mohammed','m','zyoud','m');
insert into person values ('8458458454','ahmad','a','ghannam','m');
#insert into person values ('9999999999','samer','r','far','m');
#insert into person values ('5555444444','tawfiq','a','abo natshah','m');
insert into person values ('2200220022','obada','i','yahya','m');
insert into person values ('1122112211','omar','s','hantouli','m');
#insert into person values ('1118584543','mohammed','k','hamed','m');
insert into person values ('8115182592','ziad','t','abo tankhyaa','m');
#insert into person values ('4550908451','shadi','b','alqamar','m');


insert into person values ('6667788900','roaa','n','jaoub','f');
#insert into person values ('8484848484','suhad','z','abo alroub','f');
insert into person values ('8383838383','sara','a','zalat','f');
insert into person values ('3829359289','moneera','l','dwekat','f');
#insert into person values ('9528468134','mariam','s','abo arra','f');
insert into person values ('9557284280','hiba','j','jardon','f');
#insert into person values ('8116518109','rahmah','h','khalid','f');
insert into person values ('9851819094','zolaikhah','s','abo lafha','f');
insert into person values ('8110894616','shereen','o','abo asbah','f');
#insert into person values ('1216594354','malak','k','hamed','f');
/// 
///inserted data
#insert into employees values('5555444444',5000,'bs',20);
#insert into employees values('9999999999',3000,'bs',15);
#insert into employees values('0123456789',6000,'bs',25);
#insert into employees values('8484848484',3000,'ba',12);
#insert into employees values('9528468134',5000,'bs',15);
#insert into employees values('1216594354',2500,'ba',10);
#insert into employees values('4550908451',1500,'High school diploma',5);
#insert into employees values('8116518109',6000,'m.d',20);
insert into employees values('1118584543',8000,'ba',30);
///
# chemestry , physics , english, math, Geography, history ,biology
insert into teacher values('5555444444','Chemistry','f');
insert into teacher values('9999999999','math','f');
insert into teacher values('0123456789','physics','f');
insert into teacher values('8484848484','english','p');
insert into teacher values('9528468134','Geography','f');



