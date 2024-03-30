------------------------ Part 2 --------------------------------------------------------
SELECT * FROM books WHERE released_year != 2017;
select title, author_fname from books where author_fname Like '%d%';
select title, author_fname from books where author_fname Not Like '%f%';
select * from books where released_year>2000;
select * from books where pages>300;
select 99>1; -- result is 1 means correct 
select 0>2; -- 
select * from books where released_year>=1985;
select *from books where  released_year>=1985 and  author_fname like 'da%';
select title from books where char_length(title)>30;
select title from books where char_length(title)>30 and pages>500;
select title, released_year from books where released_year between 2010 and 2019;
select title, pages from books where pages not between 300 and 600;
select title, pages from books where pages  between 300 and 600;
select name,birthdt from people where year(birthdt)<2006; 
select * from people where birthtime between cast('12:00:00' as Time ) and cast('17:30:25' as Time);
select title, author_lname from books where author_lname = 'Smith' or author_lname = 'Carver' or author_lname = 'Lahiri';
select title, author_lname from books where author_lname in( 'Smith', 'Carver', 'Lahiri');
select title, author_lname from books where author_lname Not In( 'Smith', 'Carver', 'Lahiri');
select * from books where released_year != 2002 and released_year != 2004 and released_year != 2006 and released_year != 2008 
and released_year != 2010 and released_year != 2012 and released_year != 2014;
select * from books where released_year not in (2002, 2004, 2006, 2008, 2010, 2012, 2014);
-- ?select *,case when released_year >=2000 and release_lock % 2 = 1 then released_year else null End as published_year from books;
select title, released_year, CASE when released_year >=2000 then 'Modern Lit' else '20 Centery Lit' End as Genre from books;
select title,stock_quantity, case when stock_quantity between 0 and 50 then '*'
when stock_quantity between 50 and 100 then '**'
else '***'
end as stock
from books;
select title,stock_quantity, case when stock_quantity<= 50 then '*'
when stock_quantity <= 100 then '**'
else '***'
end as stock
from books;
select * from books where released_year <1980;
select * from books where author_lname in ('Eggers', 'Chabon');
select * from books where author_lname= 'Lahiri' and released_year >2000;
select * from books where author_lname like 'C%' or  author_lname like 'S%';
select title, concat(author_fname,' ' ,author_lname), case
when title= '%stories%' then 'Short Stories'
when title in ('Just Kids', 'Heart Breaking Work') then 'Memoir' 
else 'novel'
 end
 from books;
 
 select author_fname, author_lname, case 
 when count(*) = 1 then concat (count(*), ' ', 'book') 
 else concat (count(*), ' ', 'books')
 end as Count
 from books where author_lname is not null group by author_fname, author_lname;
 
 
create table concats (full_name varchar(50), phone_number varchar(13)not null unique);
insert into concats(full_name, phone_number) values('mahsa dorri', '6547890978');
insert into concats(full_name, phone_number) values('mahsa dorri', '6547899978');
create table users(name varchar(50), age INT check(age > 18));
insert into users (name, age) values ('asghar', 9);
insert into users (name, age) values ('asghar', 19);
insert into users (name, age) values ('asghar', 18);
create table users2(name varchar(50), age INT
constraint  age_adult check(age > 18));
insert into users2 (name, age) values ('asghar', 9);

use book_shop;
alter table books add column genre varchar(20) not null default 'N/A';
alter table books drop column genre    ;
  
rename table books to book;
 rename table book to books;
 alter table books rename column pages to page;
 alter table books rename column page to pages;
 create database shop;
 drop table customers, orders;
 use shop;
create table customers(
id int primary key auto_increment,
first_name varchar (50),
last_name varchar(50),
email varchar(50));

create table orders(
id int primary key auto_increment,
order_date Date,
amount decimal(8,2),
customer_id int,
FOREIGN KEY (customer_id) REFERENCES customers(id) on delete cascade

);
insert into  customers (first_name, last_name, email) values('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');

insert into orders(order_date, amount, customer_id) values('2016-02-10', 99.99, 1),
       ('2017-11-11', 35.50, 1),
       ('2014-12-12', 800.67, 2),
       ('2015-01-03', 12.50, 2),
       ('1999-04-11', 450.25, 5);
select customers.first_name, customers.last_name, orders.order_date from customers  join orders on customers.id = orders.customer_id;
select * from orders where customer_id in (select id from customers where first_name='George');
select * from customers join orders where customers.id = orders.customer_id;
select first_name, last_name, sum(amount) as total from customers join orders where customers.id = orders.customer_id group by first_name, last_name order by total ;
-- When ONLY_FULL_GROUP_BY is enabled, all columns in the SELECT list that are not aggregated (i.e.,
-- not part of an aggregate function like SUM(), COUNT(), etc.) must be included in the GROUP BY clause.
-- This rule ensures that the query result is unambiguous with respect to the columns that are grouped.
SELECT 
    first_name, last_name, order_date, amount
FROM
    customers
        LEFT JOIN
    orders ON orders.customer_id = customers.id;
 
 
SELECT 
    order_date, amount, first_name, last_name
FROM
    orders
        LEFT JOIN
    customers ON orders.customer_id = customers.id;
    
select first_name, last_name, ifnull(sum(amount), 0) from orders join customers on orders.customer_id = customers.id group by first_name, last_name order by sum(amount);

SET SQL_SAFE_UPDATES = 0;
-- ?????
delete from customers where last_name = 'Goerge';
select * from customers;
select * from orders;
create table  student (student_id int primary key auto_increment,
first_name varchar(50)
);
drop table papers;
CREATE TABLE papers (
    student_id INT,
    title VARCHAR(50),
    grade REAL,
    FOREIGN KEY (student_id) REFERENCES student(student_id)
);

INSERT INTO student (first_name) VALUES 
('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');
 
INSERT INTO papers (student_id, title, grade ) VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);
select * from papers;
select * from student;
select first_name, title, grade from student join papers on papers.student_id = student.student_id order by grade desc;
select first_name, title, grade from papers left join student on  papers.student_id = student.student_id;
select first_name, ifnull(title, 'Missing'), ifnull(grade,0) from papers left join student on  papers.student_id = student.student_id;
select first_name, avg(grade) as average from student join papers on papers.student_id = student.student_id group by first_name order by average  ;
select first_name, ifnull(title, 'Missing'), ifnull(grade,0),
case
 when ifnull(grade,0)>=75 then 'pass'
when ifnull(grade,0)<=75 then 'fail'
end
 from papers left join student on  papers.student_id = student.student_id;
 create database tv;
 use tv;
create table reviewers (
id int primary key auto_increment,
first_name varchar(50),
last_name varchar(50)
);
CREATE TABLE series (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(50),
    released_year YEAR,
    genre ENUM('Drama', 'Comedy', 'Action', 'Science Fiction', 'Animation')
);

create table reviews(
id int primary key auto_increment,
rating decimal(4,2),
series_id int,
reviewer_id int,
FOREIGN KEY (series_id) REFERENCES series(id),
FOREIGN KEY (reviewer_id) REFERENCES reviewers(id)
);
INSERT INTO series (title, released_year, genre) VALUES
    ('Archer', 2009, 'Animation'),
    ('Arrested Development', 2003, 'Comedy'),
    ("Bob's Burgers", 2011, 'Animation'),
    ('Bojack Horseman', 2014, 'Animation'),
    ("Breaking Bad", 2008, 'Drama'),
    ('Curb Your Enthusiasm', 2000, 'Comedy'),
    ("Fargo", 2014, 'Drama'),
    ('Freaks and Geeks', 1999, 'Comedy'),
    ('General Hospital', 1963, 'Drama'),
    ('Halt and Catch Fire', 2014, 'Drama'),
    ('Malcolm In The Middle', 2000, 'Comedy'),
    ('Pushing Daisies', 2007, 'Comedy'),
    ('Seinfeld', 1989, 'Comedy'),
    ('Stranger Things', 2016, 'Drama');
 
 
INSERT INTO reviewers (first_name, last_name) VALUES
    ('Thomas', 'Stoneman'),
    ('Wyatt', 'Skaggs'),
    ('Kimbra', 'Masters'),
    ('Domingo', 'Cortes'),
    ('Colt', 'Steele'),
    ('Pinkie', 'Petit'),
    ('Marlon', 'Crafford');
    
 
INSERT INTO reviews(series_id, reviewer_id, rating) VALUES
    (1,1,8.0),(1,2,7.5),(1,3,8.5),(1,4,7.7),(1,5,8.9),
    (2,1,8.1),(2,4,6.0),(2,3,8.0),(2,6,8.4),(2,5,9.9),
    (3,1,7.0),(3,6,7.5),(3,4,8.0),(3,3,7.1),(3,5,8.0),
    (4,1,7.5),(4,3,7.8),(4,4,8.3),(4,2,7.6),(4,5,8.5),
    (5,1,9.5),(5,3,9.0),(5,4,9.1),(5,2,9.3),(5,5,9.9),
    (6,2,6.5),(6,3,7.8),(6,4,8.8),(6,2,8.4),(6,5,9.1),
    (7,2,9.1),(7,5,9.7),
    (8,4,8.5),(8,2,7.8),(8,6,8.8),(8,5,9.3),
    (9,2,5.5),(9,3,6.8),(9,4,5.8),(9,6,4.3),(9,5,4.5),
    (10,5,9.9),
    (13,3,8.0),(13,4,7.2),
    (14,2,8.5),(14,3,8.9),(14,4,8.9);
    
    select title, rating from series join reviews on series.id = reviews.series_id;
    select title, round(avg(rating), 2) as average from series join reviews on series.id = reviews.series_id group by title order by average ;
    select first_name, last_name, round(avg(rating),2) as average from reviewers join reviews on reviewers.id = reviews.reviewer_id group by first_name, last_name order by average ;
	select title from reviews join series on series.id = reviews.series_id where rating is null ;
    select genre, round(avg(rating),2) as avg_rating from series join reviews on reviews.series_id = series.id group by genre;
select first_name, last_name, count(rating ) as count ,ifnull(max(rating),0) as max,ifnull( min(rating),0) as min, round(avg(rating),2) as avg,
case
when count(rating )>=0 then 'Active'
Else 'InActive'
end as status
from reviewers join  reviews on reviews.reviewer_id = reviewers.id group by first_name, last_name;

    select title, round(avg(rating),2) as average, concat(first_name, ' ' ,last_name)
    from reviewers join reviews on reviewers.id = reviews.reviewer_id join series on reviews.series_id = series.id group by title,first_name, last_name order by average ;

 