DROP DATABASE vinylrecordshop;
DROP DATABASE IF EXISTS vinylrecordshop;

CREATE DATABASE vinylrecordshop;

USE vinylrecordshop;
show tables;

CREATE TABLE album (
    albumId INT AUTO_INCREMENT,
    CONSTRAINT pk_album 
        PRIMARY KEY (albumId),
    albumTitle VARCHAR(100) NOT NULL,
    label VARCHAR(50),
    releaseDate DATE,
    price DECIMAL(5,2)
);

desc album;


create table artist (
	artistId int auto_increment,
    CONSTRAINT pk_artist
        PRIMARY KEY (artistId),
	artistFirstName VARCHAR(25),
    artistLastName varchar(50)
);

desc artist;

create table band (
	bandId int auto_increment,
    CONSTRAINT pk_band
        PRIMARY KEY (bandId),
	bandName VARCHAR(50)
);

desc band;


DROP TABLE IF EXISTS song;
CREATE TABLE song (
    songId INT NOT NULL AUTO_INCREMENT,
    songTitle VARCHAR(100) NOT NULL,
    videoUrl VARCHAR(100),
    bandId INT NOT NULL,
    CONSTRAINT pk_song 
    	PRIMARY KEY (songId),
    CONSTRAINT fk_song_band 
    	FOREIGN KEY (bandID)
    	REFERENCES band(bandId)
);

desc song;


DROP TABLE IF EXISTS songAlbum;
CREATE TABLE songAlbum (
    songId INT,
    albumId INT,
    CONSTRAINT pk_songAlbum 
    	PRIMARY KEY (songId, albumId),
    CONSTRAINT fk_songAlbum_song
    	FOREIGN KEY (songId)
    	REFERENCES song(songId),
    CONSTRAINT fk_songAlbum_album
    	FOREIGN KEY (albumId)
    	REFERENCES album(albumId)
);

desc songAlbum;


drop table if exists bandArtist;
create table bandArtist (
	bandId int,
    artistId int,
    constraint pk_bandArtist
         primary key (bandId, artistId),
	constraint fk_bandArtist_band
        foreign key (bandId)
        references band(bandId),
	constraint fk_bandArtist_artist
        foreign key (artistId)
        references artist(artistId)
);

desc bandArtist;

-- inserting data
INSERT INTO album VALUES (1,'Imagine','Apple','1971-9-9',9.99);