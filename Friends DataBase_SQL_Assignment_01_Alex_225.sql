drop database if exists friendsdb;

-- Create a database:

CREATE DATABASE friends_database;

-- Use the created database:

USE friends_database;

-- Create a table named "friends" with three columns (id, name, birthday):

CREATE TABLE friends (
    id INT,
    name TEXT,
    birthday DATE
);

-- Add a record for John Doe with a birthday of 1996-08-30:

INSERT INTO friends (id, name, birthday)
VALUES (1, 'John Doe', '1996-08-30');

-- View the contents of the table using SELECT:

SELECT * FROM friends;

-- Add two more records for your preferred friends:

INSERT INTO friends (id, name, birthday)
VALUES 
(2, 'Sonu', '2000-01-01'),
(3, 'Rinku', '1998-05-10');

-- Change the name of the first friend from 'John Doe' to 'Luis Johnson':

UPDATE friends SET name = 'Luis Johnson' WHERE id = 1;

-- Add a new column called email to store email addresses:

ALTER TABLE friends ADD COLUMN email VARCHAR(100);

-- Update the email address for everyone in your table:
-- For Luis Johnson's email update:

UPDATE FRIENDS SET email = 'luis@gmail.com' WHERE id = 1;

-- Remove Luis Johnson from the friends table:

DELETE FROM friends WHERE id = 1;

-- View the complete table using SELECT:

SELECT * FROM friends;

