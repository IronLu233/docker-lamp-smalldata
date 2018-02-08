CREATE DATABASE ninechapter;
USE ninechapter;
CREATE USER ninechapter
IDENTIFIED BY 'bigdata';
GRANT ALL PRIVILEGES ON *.* TO ninechapter
IDENTIFIED BY 'bigdata'
WITH
GRANT OPTION;
create table output
(
    starting_phrase VARCHAR(250),
    following_word VARCHAR(250),
    count INT
);
FLUSH PRIVILEGES;
