show databases;
-- creat books database --
DROP DATABASE IF EXISTS books;
create database books;

use books;

-- author table
drop table if exists author;
CREATE TABLE author (
    authorId INT AUTO_INCREMENT,
    CONSTRAINT pk_author
        PRIMARY KEY (authorId),
    firstName VARCHAR(25),
    middleName VARCHAR(25),
    lastName  VARCHAR(50),
    gender  VARCHAR(1),
    dateOfBirth datetime,
    dateOfDeath datetime
);

desc author;

-- author book
drop table if exists book;
create table book (
	bookId INT AUTO_INCREMENT,
    CONSTRAINT pk_book
        PRIMARY KEY (bookId),
	title varchar(100),
    publicationDate datetime
);

desc book;

-- author format
drop table if exists format;
create table format (
	formatId INT AUTO_INCREMENT,
    CONSTRAINT pk_format
        PRIMARY KEY (formatId),
	formatName varchar(12)
);

desc format;

-- genre table
drop table if exists genre;
create table genre (
	genreId INT AUTO_INCREMENT,
    CONSTRAINT pk_genre
        PRIMARY KEY (genreId),
	genreName varchar(25)
);

desc genre;

-- create authorBook table with foreign keys
drop table if exists authorBook;
create table authorBook (
	authorId int,
    bookId int,
    constraint pk_authorBook
       primary key (authorId, bookId),
	constraint fk_authorBook_author
      foreign key (authorId)
      references author(authorId),
	constraint fk_authorBook_book
      foreign key (bookId)
      references book(bookId)
);

desc authorBook;


-- bookFormat

drop table if exists bookFormat;
create table bookFormat (
	bookId int,
    formatId int,
    constraint pk_bookFormat
       primary key (bookId, formatId),
	constraint fk_bookFormat_book
      foreign key (bookId)
      references book(bookId),
	constraint fk_bookFormat_format
      foreign key (formatId)
      references format(formatId),
	price double,
    quantityOnHand int
);

desc bookFormat;


-- bookGenre
drop table if exists bookGenre;
create table bookGenre (
	bookId int,
    genreId int,
    constraint pk_bookGenre
       primary key (bookId, genreId),
	constraint fk_bookGenre_book
      foreign key (bookId)
      references book(bookId),
	constraint fk_bookGenre_genre
      foreign key (genreId)
      references genre(genreId)
);

desc bookGenre;
