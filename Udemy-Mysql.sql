show databases;
create database bookstore;
drop database bookstore;
create database PetShop;
drop database PetShop;
create database BookStore;
use BookStore;
select database();
drop database PetShop;
create database People;
use People;
create table Tweets(
username varchar(15),
tweetcontent varchar(140),
numberofFavorites int
);
show columns from tweets;
desc tweets;
create table Msgs(
numbers varchar(15),
msgContent varchar(140)
);
drop table msgs;

create database Example;
use Example;
create table pasteries(
name varchar(150),
quantity int
);
drop table pasteries;
drop database Example
;
select database();
use BookStore;
create table stores( location varchar(150), name varchar(50));
insert into stores (location, name) values ("185 eglinton", "Mahsa");
insert into stores (location, name) values ("17 bathurst", "Asghar");
select * from stores;
insert into stores (location, name) values ("16 bathurst", "Qaasem"), ("10 bathurst", "Houshang");
create table people(firstname varchar(50), lastname varchar(50), age int);
insert into people(firstname, lastname, age) values("Mahsa","Dorri",16),("ghasem","ghasemi",17);
desc people;
create table people2(firstname varchar(50) not null, lastname varchar(50) not null, age int not null);
insert into people2(firstname, age) values("abdolah",16),("yadolah",17);
desc people2;
select * from people2;

create table people5(firstname varchar(50) not null default 'unamed', lastname varchar(50)  default 'undefined', age int  default 18);
desc people3;
insert into people5(firstname, lastname, age) values();
select * from people3;

create table people6(firstname varchar(50) not null default 'unamed' , lastname varchar(50)  default 'undefined'  , age int  default 18, Id int not null primary key);
insert into people6(firstname, lastname, age, Id) values ("mahsa", "Dorri",30,12);
desc people6;
insert into people6(firstname, lastname, age, Id) values ("zahra", "zahra",30,12);
create table people7(firstname varchar(40) not null default 'empty', lastname varchar(40) not null default'empty', age int not null, id int primary key auto_increment );

CREATE TABLE cats (
  id INT AUTO_INCREMENT PRIMARY KEY,
  catname VARCHAR(100) not null ,
  breed VARCHAR(100)not null ,
  age INT
);
insert into cats( catname, breed, age) values("Mahsa", "a",3),("asghar", "b", 4), ("Abbas", "C",5);
insert into cats( catname, breed, age) values("nazi", "a",2),("shasi", "b", 6), ("passi", "C",2);

select catname, age from cats;
select catname from cats where age>4;
select * from cats where catname='Mahsa';

select id from cats;
select catname, breed from cats;
select * from cats where catname='Mahsa';
select id, age from cats where id=age;
select catname as kittyName from cats where id=age;
update cats set age=4 where catname ='Mahsa';
SET SQL_SAFE_UPDATES = 0;
update cats set catname='Zahra' where catname= 'Mahsa';
select catname from cats;
delete from cats where catname='Mahsa';
select * from cats;
Delete from  cats;
drop table shirts;
create database shirts_db;
use shirts_db;
create table shirts(article varchar(40) not null default 'empty', color varchar(40) not null default'empty', last_worn varchar(40) not null default'empty', shirtSize varchar(10),id int primary key auto_increment );
insert into shirts( article, color, last_worn,id ) values("Tshirt", "white","S",15),("polo_shirt", "black", "L",10), ("tank_top", "Pink","XL",9);
insert into shirts( article, color, last_worn ) values("skirt", "gray","L"),("coat", "black", "L"), ("tank_top", "bllue","Xs");
desc shirts;
select color,article,last_worn from shirts;
SELECT * from shirts WHERE last_worn = 15;
SELECT * from shirts WHERE shirtSize = 'L';
-- After crud we are working on the string features
Create database book_shop;
use book_shop;
create table books(book_id int primary key auto_increment, title varchar(100), author_fname varchar(100),
 author_lname varchar(100), released_year int, stock_quantity int, pages int );
 insert into books(title, author_fname, author_lname, released_year, stock_quantity, pages) 
 VALUES ('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526),
('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);
-- concat
select concat ('Mahsa', ' ','Dorri') as my_name;

select concat (author_fname, ' ',author_lname) as author_fullname from books;
select concat_ws (' ', author_fname, author_lname) as author_fullname from books;
-- substring 
select substring('Hello World', 1, 4);
select substring('Hello World',7);
select substring('Asghar Asghari', -4);
select title from books; -- too long 
select substring(title, 1,14) from books;
select substring(author_fname,1,1)as initial1 from books;
select substring(author_lname,1,1)as initial2 from books;

SELECT CONCAT
    (substring(author_fname,1,1), '.', substring(author_lname,1,1)) AS 'initial' FROM books;
    -- replace
select replace ('I am Mahsa', 'I am', 'This is');
select replace(title, ' ', '_') from books;
-- reverse 
select reverse('Mahsa Dorri')as ReverseName;
select reverse(author_fname) from books;
select concat(author_fname, reverse(author_fname)) from books;
select char_length('Mahsa');
-- char_length vas length ine ke avali baes. mishebe har zabouni ke minevisi tedade horouf ro bede valin length thedade chizi ke mibini be byte mide.
SELECT CONCAT(author_lname, ' is ', CHAR_LENGTH(author_lname), ' characters long') FROM books;

-- upper lower
select upper('mahsa');
select lower('MAHSA');
select upper(concat('i love ', title, ' !!!'))as sample from books;
-- insert, left, right, repeat tekrar mikone, trim space delete mikone ama space haie kenario na beyne word haro 
select insert('Mahsa Dorri',11 ,0,' Najafabadi');
select concat(left(author_fname,1), left(author_fname,1)) from books;
select trim(trailing '.' from '...Mahsa...');
select trim(leading '_' from '________Mahsa');
select trim(both '_' from '________Mahsaaa_______');

-- exercise 
select replace(title, ' ', ' -> ')as title from books;
select author_lname as forward, reverse(author_lname) as backward from books;
select upper(concat(author_fname,' ' ,author_lname)) from books;
select concat('The ', title, ' was released in ' , released_year) from books;
select title,  char_length(title) as character_count from books;
select concat(substr(title,10),'...') as short_title, concat(author_fname,',',author_lname) as author_name, stock_quantity from books;

-- adding new books
select database(); -- roo chi daram kar mikonam?
INSERT INTO books(title, author_fname, author_lname, released_year, stock_quantity, pages) 
VALUES 
    ('10% Happier', 'Dan', 'Harris', 2014, 29, 256), 
    ('fake_book', 'Freida', 'Harris', 2001, 287, 428),
    ('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);
-- get unique records Distinct 
Select distinct  author_lname from books;
select distinct released_year from books;
select distinct concat(author_lname," ",author_fname) from books;
SELECT DISTINCT author_fname, author_lname FROM books;
-- order by  defaul ascendinge mitouni ba  DESC taghiresh bedi. mituni az naming bade as ham estefade koni baraye ordering 
select title, author_fname, author_lname from books order by released_year ;
select title, author_fname, author_lname from books order by released_year desc ;
select title, author_fname, author_lname from books order by title desc ;
select title, author_fname, author_lname from books order by title ;
select title, author_fname, author_lname,released_year from books order by author_fname,released_year;
-- limit starting row, how many row you want 
select title, author_fname, author_lname,released_year from books order by author_fname,released_year limit 1,6;

select title, author_fname, author_lname,released_year from books where author_fname like '%Da%';
-- ba like ____ tedade harfaye lastname ro migi 
select author_fname, author_lname from books where author_fname like '____';
-- harfe dovomesh a ro bede
select author_fname, author_lname from books where author_fname like '%_a_%';
-- be harfe n tamoum she 
select author_fname, author_lname from books where author_fname like '%n';
select title, author_fname from books where title  like '%\%%';
-- Exercise
select title from books where title like '%stories%';
select title, pages from books order by pages desc limit 0, 1;
select concat(title, ' _ ', released_year) as summary from books order by released_year Desc limit 0,3;
select title, author_lname from books where author_lname like '% %';
SELECT title, released_year, stock_quantity FROM books ORDER BY stock_quantity LIMIT 3;
SELECT title, author_lname FROM books ORDER BY author_lname, title;
-- aggregate functions 1. count 2. groub by
select count(*) from books;
select count(author_fname) from books;
select count(Distinct author_fname) from books;
select title from books where title like '%the%';
select count(*) from books where title like '%the%';
-- group by 
select author_lname, count(*)as writtenbooks from books group by (author_lname) order by writtenbooks desc;
select count( stock_quantity), released_year from books group by (released_year);
select released_year year, count(*) from books group by released_year;
-- Min and Max
select max(pages) from books;
select min(author_lname), max(author_lname) from books;
select title, pages from books where pages = ( select max(pages)from books);
select title from books where released_year =(select Min(Released_year) from books);
 -- group by
 SELECT author_fname, author_lname, COUNT(*) FROM books GROUP BY author_lname, author_fname;
SELECT CONCAT(author_fname, ' ', author_lname) AS author,  COUNT(*) FROM books GROUP BY author;
-- group by and Min Max
select author_fname, author_lname, count(*), min(released_year), max(released_year) from books group by author_fname, author_lname;
-- sum
select author_lname, sum(pages) from books where author_lname like '%ir%'group by author_lname ;
-- avg
use book_shop;
select avg(Released_year) from books;
select avg(stock_quantity) from books;
select avg(pages) from books;
SELECT Released_year, AVG(stock_quantity) AS average_stock_quantity, COUNT(*) AS total_books
FROM books
GROUP BY Released_year;
-- how many book for each yeaRS
select count(*)as each_year_books, released_year from books group by released_year;
-- all the books in the stock
select sum(stock_quantity) from books;
-- avg released year for each author
select concat(author_fname,' ' ,author_lname)as fullName, avg(released_year) Average from books group by fullName;
select concat(author_fname,' ' ,author_lname)as Name, pages from books where pages = (select max(pages)from books) order by pages desc;
-- select concat(author_fname,' ' ,author_lname)as Name, max(pages) from books;
select released_year, count(*),Avg(pages) from books group by released_year; 
-- date time 
use book_shop;
create  table people;
CREATE TABLE people (
	name VARCHAR(100),
    birthdate DATE,
    birthtime TIME,
    birthdt DATETIME
);
 
INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES ('Elton', '2000-12-25', '11:00:00', '2000-12-25 11:00:00');
 
INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES ('Lulu', '1985-04-11', '9:45:10', '1985-04-11 9:45:10');
 
INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES ('Juan', '2020-08-15', '23:59:00', '2020-08-15 23:59:00');
select now();
-- new bpen babies like 
insert into people (name, birthdate, birthtime, birthdt) values ('Mahsa', curdate(), curtime(), now());
select * from people;
-- Date and functions 
SELECT 
birthdate, year(birthdate), monthname(birthdt), week(birthdt), hour(birthdt), month(birthdt), day(birthdt) from people;
 
SELECT 
    birthdate,
    MONTHNAME(birthdate),
    YEAR(birthdate)
FROM people;
select birthdt, data_format(birthdate, '%a %b %D') from people;
-- date math
select birthdate, date_add(birthdate, interval 19 year) from people;

INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES ('Mahsa', '1993-07-11', '11:10:00', '1993-07-11 11:10:00');

select birthdate, date_add(birthdate, interval 31 year) from people;
select birthdt, dateDiff(birthdate, now()) from people;
-- timestamps
CREATE TABLE captions (
  text VARCHAR(150),
  created_at TIMESTAMP default CURRENT_TIMESTAMP
);
 
CREATE TABLE captions2 (
  text VARCHAR(150),
  created_at TIMESTAMP default CURRENT_TIMESTAMP,
  updated_at TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
-- exe
create table inventory(item_name varchar(50), price double, quantity int);
select curtime();
select dayofweek(curdate());
select dayname(curdate());
select birthdt, dayname(birthdt) from people;
select date_format(now(),'%m/%d/%y');
select date_format(now(),'%M,%D at  %k:%i');
CREATE TABLE tweets(
    content VARCHAR(140),
    username VARCHAR(20),
    created_at TIMESTAMP DEFAULT NOW()
);
 
INSERT INTO tweets (content, username) VALUES('this is my first tweet', 'coltscat');
SELECT * FROM tweets;
 
INSERT INTO tweets (content, username) VALUES('this is my second tweet', 'coltscat');
SELECT * FROM tweets;
