-- Create Database:

CREATE DATABASE myfriendsdb;

-- Use Database:

USE myfriendsdb;


-- Create Table 'Friends'

CREATE TABLE friends (
    id INT,
    name TEXT,
    birthday DATE
);

-- Insert a record for John Doe

INSERT INTO friends (id, name, birthday)
VALUES (1, 'John Doe', '1996-08-30');

-- View the table using SELECT

SELECT * FROM friends;

-- Add two more friends

INSERT INTO friends (id, name, birthday)
VALUES 
  (2, 'Friend 1', '2000-01-01'),
  (3, 'Friend 2', '1998-05-10');
  
  -- Change the name of the first friend from John Doe to Luis Johnson
  
  UPDATE friends SET name = 'Luis Johnson' WHERE id = 1;

-- Add a new column called email

ALTER TABLE friends ADD COLUMN email VARCHAR(100);

-- Update email addresses for everyone in the table

UPDATE friends SET email = CASE 
    WHEN id = 1 THEN 'luis@gmail.com'
    WHEN id = 2 THEN 'jack0124@gmail.com'
    WHEN id = 3 THEN 'susan8598@gmail.com'
END;

-- **7. Remove Luis from Friends table:**  
-- To remove Luis from our "friends" table:
 
  DELETE FROM friends WHERE id=1;

-- View complete table using SELECT:
-- After performing these operations:

SELECT * FROM FRIENDS;
