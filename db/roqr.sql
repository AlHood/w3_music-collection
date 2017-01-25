


DROP TABLE IF EXISTS albums;
DROP TABLE IF EXISTS artists;


CREATE TABLE artists(
id serial4 primary key,
name varchar(255)
);


CREATE TABLE albums (
id serial4 primary key,
title varchar(255),
genre varchar(255),
performer_id INT4 REFERENCES artists(id)
);






