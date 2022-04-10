CREATE DATABASE myapp;
go

USE myapp;
go

create table articles(id int, content varchar(max));
insert into articles values (1, 'Over 3.8 billion people use the internet today, which is 40% of the worlds population.'),
(2, '8 billion devices will be connected to the internet by 2020.'),
(3, 'More than 570 new websites are created every minute.'),
(4, 'There are over 3.5 billion searches per day on Google.'),
(5, 'By 2020, video will account for about 80% of all internet traffic.'),
(6, '340,000 tweets are sent per minute.'),
(7, '90% of the world’s data has been created in the last couple years.');

create table users(username varchar(32), password varchar(32));
insert into users values('red0xff', 'PasswordTest1'),
('admin', 'AdminPass1337'),
('guest', 'GuestPass');
