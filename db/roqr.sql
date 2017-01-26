


DROP TABLE IF EXISTS albums CASCADE;
DROP TABLE IF EXISTS artists CASCADE;


CREATE TABLE artists(
id serial4 primary key,
name varchar(255) not null
);


CREATE TABLE albums (
id serial4 primary key,
title varchar(255) not null,
genre varchar(255) not null,
performer_id INT4 REFERENCES artists(id) ON DELETE CASCADE
);






