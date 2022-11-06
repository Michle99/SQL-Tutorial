DROP DATABASE IF EXISTS hotel;

CREATE DATABASE hotel;

-- Make sure we're in the correct database before we add schema.
USE hotel;

CREATE TABLE guest (
    guestId INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    street VARCHAR(50) NOT NULL,
    city VARCHAR(50) NOT NULL,
    state CHAR(2) NOT NULL,
    zipcode CHAR(5) NOT NULL,
    phoneNumber CHAR(100) NOT NULL
);

desc room;

CREATE TABLE room (
	roomId int primary key not null auto_increment,
    roomNumber smallint not null,
  --   constraint pk_room primary key (roomNumber),
    adaAcessible varchar(3) not null,
    standardOccupancy tinyint not null,
    maximumOccupancy tinyint not null,
    basePrice decimal(5,2) not null,
    extraPerson tinyint not null
);
drop table room;

create table roomType ( -- prolly create a new table for roomRoomType
	roomTypeName varchar(10) not null,
    roomId int not null,
    primary key pk_roomType(roomId),
    foreign key fk_roomType_room(roomId)
       references room(roomId)
       on delete cascade
);

CREATE TABLE reservation (
	reservationId int primary key auto_increment,
    guestId int not null,
	FOREIGN KEY fk_reservation_guest (guestId)  REFERENCES guest(guestId) on delete cascade,
    adult tinyint not null,
    children tinyint not null,
    startDate date,
	endDate date,
    totalRoomCost decimal(12,2)
);
desc reservation;

create table roomReservation (
    reservationId int not null,
    roomId int not null,
    PRIMARY KEY pk_roomReservation (reservationId, roomId),
    FOREIGN KEY fk_roomReservation_reservation (reservationId)
        REFERENCES reservation(reservationId) on delete cascade,
    FOREIGN KEY fk_roomReservation_room (roomId)
        REFERENCES room(roomId) on delete cascade
);

create table amenity (
	amenityId int primary key auto_increment,
    amenityName varchar(15) not null,
    extraCost decimal(4,2) not null
);

create table roomAmenity (
	roomId int not null,
    amenityId int not null,
    primary key pk_roomAmenity (roomId, amenityId),
    foreign key fk_roomAmenity_room (roomId)
       references room(roomId) on delete cascade,
	foreign key fk_roomAmenity_amenity(amenityId)
       references amenity(amenityId) on delete cascade
);

