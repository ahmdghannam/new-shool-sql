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
create table grades(
student_id char(10),
course_id char(5),
great_mark integer not null,
final integer,
midterm integer,
quiz integer,
primary key(student_id,course_id));

CREATE TABLE absences(
absence_id CHAR(10) PRIMARY KEY,
person_id CHAR(10) not null,
absence_date DATE not null,
cause VARCHAR(20) 

);
CREATE TABLE punishments(
punishment_id VARCAHR2(5) PRIMARY KEY,
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
job_title varchar(25) check 
(job_title in ('doctor','Clean Worker','Social advisor','manager','IT proficient','cafeteria worker','secretaria','Librarian')));
create table student(
student_id char(10) primary key,
parent_phone char(10),
section_id char(5) not null,
class_level char(3) not null);

-- omar hantouli

create table teach(
teacher_id char(10),
course_id char(5),
section_id char(5),
primary key(teacher_id, course_id, section_id)
);
create table graduated_from(
student_id char(10) not null,
class_level char(3) not null,
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
person_id char(10) not null,
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
alter table borrow add (constraint person_borrow foreign key(person_id) references person(person_id));



/// inserted into school
#insert into person values ('0123456789','ahmad','m','mostufa','m');
insert into person values  ('1112223333','mohammed','m','zyoud','m');
insert into person values  ('8458458454','ahmad','a','ghannam','m');
#insert into person values ('9999999999','samer','r','far','m');
#insert into person values ('5555444444','tawfiq','a','abo natshah','m');
insert into person values  ('2200220022','obada','i','yahya','m');
insert into person values  ('1122112211','omar','s','hantouli','m');
#insert into person values ('1118584543','mohammed','k','hamed','m');
insert into person values  ('8115182592','ziad','t','abo tankhyaa','m');
#insert into person values ('4550908451','shadi','b','alqamar','m');
#insert into person values ('3948439392','jafar','k','shawahni','m');
insert into person values  ('3288348292','abed','i','yahya','m');


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
insert into person values ('8642859746','ahmad','m','zyoud','m');
insert into person values ('7648319752','baraa','j','shawahni','f');
insert into person values ('1349761258','tareq','j','shawahni','m');
insert into person values ('8526741396','sara','j','fares','f');
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
#insert into employees values('1118584543',8000,'ba',30);
#insert into employees values('3948439392',4000,'bs',15);
///
# chemestry , physics , english, math, Geography, history ,biology
insert into teacher values('5555444444','Chemistry','f');
insert into teacher values('3948439392','Chemistry','p');
insert into teacher values('9999999999','math','f');
insert into teacher values('0123456789','physics','f');
insert into teacher values('8484848484','english','p');
insert into teacher values('9528468134','Geography','f');

#students
insert into student values('1112223333',0598654268,'12345','C11');
insert into student values('8458458454',0568945321,'12345','C11');
insert into student values('2200220022',0594154568,'12345','C11');
insert into student values('1122112211',Null,'00147','C10');
insert into student values('8115182592',0599684262,'00147','C10');
insert into student values('8383838383',0591234261,'00147','C10');
insert into student values('3829359289',0598654260,'00258','C9');
insert into student values('6667788900',Null,'00258','C9');
insert into student values('9557284280',0598654264,'00258','C9');
insert into student values('9851819094',Null,'00369','C8');
insert into student values('8110894616',Null,'00369','C8');
insert into student values('8642859746',0598678269,'00369','C8');
insert into student values('7648319752',0598648265,'54321','C7');
insert into student values('1349761258',Null,'54321','C7');
insert into student values('8526741396',0598669366,'54321','C7');
insert into student values('3288348292',0593828293,'12345','C11');



# depends_on
insert into depends_on values('1349761258','3948439392');
insert into depends_on values('7648319752','3948439392');


# non edu

#insert into non_educationl_employees values('4550908451','Clean Worker');
#insert into non_educationl_employees values('8116518109','doctor');
#insert into non_educationl_employees values('1216594354','Social advisor');
#insert into non_educationl_employees values('1118584543','manager');


#room
insert into room values ('A1',5,'Lecture room');
insert into room values ('A2',8,'Lecture room');
insert into room values ('B2',6,'Lecture room');
insert into room values ('L1',11,'Lab');
insert into room values ('L2',14,'Lab');

#section
#insert into section values ('12345','A1');
#insert into section values ('00147','A2');
#insert into section values ('00258','B2');
#insert into section values ('00369','L1');
insert into section values ('54321','L2');

#class
insert into class values('C7',500);
#insert into class values('C8',1000);
#insert into class values('C9',1500);
#insert into class values('C10',2000);
#insert into class values('C11',2500);

 #course
insert into course values ('21001','C7','math');
insert into course values ('21002','C7','english');
insert into course values ('21003','C7','Geography');
insert into course values ('21004','C7','physics');
insert into course values ('21005','C7','Chemistry');

#insert into course values ('21006','C8','math');
#insert into course values ('21007','C8','english');
#insert into course values ('21008','C8','physics');
#insert into course values ('21009','C8','Geography');
#insert into course values ('21010','C8','Chemistry');

#insert into course values ('21011','C9','math');
#insert into course values ('21012','C9','english');
#insert into course values ('21013','C9','physics');
#insert into course values ('21014','C9','Geography');
#insert into course values ('21015','C9','Chemistry');

#insert into course values ('21016','C10','math');
#insert into course values ('21017','C10','english');
#insert into course values ('21018','C10','physics');
#insert into course values ('21019','C10','Geography');
#insert into course values ('21020','C10','Chemistry');

#insert into course values ('21021','C11','math');
#insert into course values ('21022','C11','english');
#insert into course values ('21023','C11','physics');
#insert into course values ('21024','C11','Geography');
#insert into course values ('21025','C11','Chemistry');

# teach
#insert into teach values('9999999999','21021','12345');
#insert into teach values('8484848484','21022','12345');
#insert into teach values('0123456789','21023','12345');
#insert into teach values('9528468134','21024','12345');
#insert into teach values('5555444444','21025','12345');


#insert into teach values('9999999999','21016','00147');
#insert into teach values('8484848484','21017','00147');
#insert into teach values('0123456789','21018','00147');
#insert into teach values('9528468134','21019','00147');
#insert into teach values('3948439392','21020','00147');

#insert into teach values('9999999999','21011','00258');
#insert into teach values('8484848484','21012','00258');
#insert into teach values('0123456789','21013','00258');
#insert into teach values('9528468134','21014','00258');
#insert into teach values('5555444444','21015','00258');

#insert into teach values('9999999999','21006','00369');
#insert into teach values('8484848484','21007','00369');
#insert into teach values('0123456789','21008','00369');
#insert into teach values('9528468134','21009','00369');
#insert into teach values('3948439392','21010','00369');

#insert into teach values('9999999999','21001','54321');
#insert into teach values('8484848484','21002','54321');
#insert into teach values('0123456789','21003','54321');
#insert into teach values('9528468134','21004','54321');
#insert into teach values('5555444444','21005','54321');
...........................................................................................................................
insert into grades values('1112223333','21021',45,30,10);
insert into grades values('1112223333','21022',50,30,10);
insert into grades values('1112223333','21023',25,30,15);
insert into grades values('1112223333','21024',50,20,5);
insert into grades values('1112223333','21025',35,23,10);

insert into grades values('8458458454','21021',45,22,6);
insert into grades values('8458458454','21022',43.5,12.5,7);
insert into grades values('8458458454','21023',30.5,25,8);
insert into grades values('8458458454','21024',46.5,20,10);
insert into grades values('8458458454','21025',35,15,7);

insert into grades values('2200220022','21021',10,11,4.5);
insert into grades values('2200220022','21022',50,30,10);
insert into grades values('2200220022','21023',41,25,10);
insert into grades values('2200220022','21024',40.5,35,10);
insert into grades values('2200220022','21025',11,15,6);

insert into grades values('3288348292','21021',45,31.5,10);
insert into grades values('3288348292','21022',45.5,30,10);
insert into grades values('3288348292','21023',25,30,15);
insert into grades values('3288348292','21024',50,20,5);
insert into grades values('3288348292','21025',35,23,10);

insert into grades values('1122112211','21016',30,22,1);
insert into grades values('1122112211','21017',33.5,30,10);
insert into grades values('1122112211','21018',41,25.5,10);
insert into grades values('1122112211','21019',17,20,10);
insert into grades values('1122112211','21020',23,15,6);

insert into grades values('8115182592','21016',30,22,1);
insert into grades values('8115182592','21017',10.5,30,10);
insert into grades values('8115182592','21018',41,25.5,10);
insert into grades values('8115182592','21019',17.5,20,10);
insert into grades values('8115182592','21020',23,15,6);

insert into grades values('8383838383','21016',30,22,1);
insert into grades values('8383838383','21017',11.5,30,10);
insert into grades values('8383838383','21018',41.5,25.5,10);
insert into grades values('8383838383','21019',17,20.5,10);
insert into grades values('8383838383','21020',23.5,15,6.5);

insert into grades values('3829359289','21011',36.5,22,8.5);
insert into grades values('3829359289','21012',30,22.5,6);
insert into grades values('3829359289','21013',30,23.5,1);
insert into grades values('3829359289','21014',30,26,6);
insert into grades values('3829359289','21015',30.5,30,1);

insert into grades values('6667788900','21011',30.5,22,10);
insert into grades values('6667788900','21012',30,23,9);
insert into grades values('6667788900','21013',29,22,8);
insert into grades values('6667788900','21014',30,21.5,7);
insert into grades values('6667788900','21015',28,22,6);

insert into grades values('9557284280','21011',30,20,7.5);
insert into grades values('9557284280','21012',24.5,21,8);
insert into grades values('9557284280','21013',30,22,9.5);
insert into grades values('9557284280','21014',29.5,23,10);
insert into grades values('9557284280','21015',22,24,5.5);

insert into grades values('9851819094','21006',40,22,1);
insert into grades values('9851819094','21007',45,22,1);
insert into grades values('9851819094','21008',50,22,1);
insert into grades values('9851819094','21009',45.5,22,1);
insert into grades values('9851819094','21010',49.5,22,1);

insert into grades values('8110894616','21006',50,22,7);
insert into grades values('8110894616','21007',45,22,8);
insert into grades values('8110894616','21008',40,22,9);
insert into grades values('8110894616','21009',30,22,10);
insert into grades values('8110894616','21010',25,22,8.5);

insert into grades values('8642859746','21006',30,22,10);
insert into grades values('8642859746','21007',40.5,22,6.5);
insert into grades values('8642859746','21008',43.5,22,12.5);
insert into grades values('8642859746','21009',45,22,5.5);
insert into grades values('8642859746','21010',50,22,6);

insert into grades values('1349761258','21001',50,35,15);
insert into grades values('1349761258','21002',45,30,10);
insert into grades values('1349761258','21003',44,31,12);
insert into grades values('1349761258','21004',42,33,14);
insert into grades values('1349761258','21005',47,35,13);

insert into grades values('7648319752','21001',49,33,15);
insert into grades values('7648319752','21002',45,30,10);
insert into grades values('7648319752','21003',44,31,12);
insert into grades values('7648319752','21004',42,33,14);
insert into grades values('7648319752','21005',47,35,13);

insert into grades values('8526741396','21001',50,33,15);
insert into grades values('8526741396','21002',30,30,10);
insert into grades values('8526741396','21003',33.5,31,12.5);
insert into grades values('8526741396','21004',42.5,32,14.5);
insert into grades values('8526741396','21005',47.5,33,13.5);





# library_books
insert into library_books values('00550','The Secret Garden','1st edition','Frances Hodgson','f');
insert into library_books values('21345','Animal Farm','2st edition','George Orwell','f');
insert into library_books values('35533','Sphere','3st edition','Michael Crichton','t');


# borrow 
insert into borrow values('55232','2200220022','35533','10/AUG/2017','17/AUG/2017','t');

#queries
# 1 - to find the student name and his parent name (that he depends on)
select s.first_name,f.first_name from depends_on d join person s on(d.student_id = s.person_id) join person f on(d.teacher_id = f.person_id);

# 2 - to find the student that had taught in our schools on every class (including his last year in the school)
select student_id from graduated_from group by student_id
having count(class_level) = (select count(class_level) from class);

# 3 - to find book that are not borrowed by using his title
select * from library_books where title = '&book_name' and is_borrowed = 'f'

# 4 - find the teachers that are not any section
select teacher_id from teacher minus select teacher_id from teach;
# 5 - find student information which have abscences more than 4

select person_id, first_name ||' '||minit|| ' '||last_name "Full Name", parent_phone from person join student on(person.person_id = student.student_id)
where person_id in (select student_id from student s join absences d on(s.student_id=d.person_id) 
group by s.student_id 
having count(d.absence_id) >= 4);
