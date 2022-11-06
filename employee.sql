DROP DATABASE IF EXISTS employees;
CREATE DATABASE employees;

USE employees;

create table employees(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name varchar(45) not null,
    location varchar(54) not null,
    department varchar(45) not null
);

select * from employees;
