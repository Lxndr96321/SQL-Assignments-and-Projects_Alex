CREATE DATABASE LIB;
USE LIB;

CREATE TABLE publisher (
		PublisherName VARCHAR(100) PRIMARY KEY NOT NULL,
		PublisherAddress VARCHAR(200) NOT NULL,
		PublisherPhone VARCHAR(50) NOT NULL);
        
CREATE TABLE book (
  BookID INT PRIMARY KEY AUTO_INCREMENT,
  Title VARCHAR(100) NOT NULL,
  PublisherName VARCHAR(100) NOT NULL,
  CONSTRAINT fk1 FOREIGN KEY(PublisherName) REFERENCES publisher(PublisherName) ON UPDATE CASCADE ON DELETE CASCADE);

        
	
CREATE TABLE library_branch (
		BranchID INT PRIMARY KEY,
		BranchName VARCHAR(100) NOT NULL,
		BranchAddress VARCHAR(200) NOT NULL);
        
        
CREATE TABLE borrower (
		CardNo INT PRIMARY KEY ,
		BorrowerName VARCHAR(100) NOT NULL,
		BorrowerAddress VARCHAR(200) NOT NULL,
		BorrowerPhone VARCHAR(50) NOT NULL);
        
        
CREATE TABLE book_loans (
  LoansID INT PRIMARY KEY AUTO_INCREMENT,
  BookID INT NOT NULL,
  CONSTRAINT fk2 FOREIGN KEY(BookID) REFERENCES book(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
  BranchID INT NOT NULL,
  CONSTRAINT fk3 FOREIGN KEY(BranchID) REFERENCES library_branch(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
  CardNo INT NOT NULL,
  CONSTRAINT fk4 FOREIGN KEY(CardNo) REFERENCES borrower(CardNo) ON UPDATE CASCADE ON DELETE CASCADE,
  DateOut VARCHAR(50) NOT NULL,
  DueDate VARCHAR(50) NOT NULL);

        
        
CREATE TABLE book_copies (
		CopiesID INT PRIMARY KEY,
		BookID INT NOT NULL,
		BranchID INT NOT NULL,
		No_Of_Copies INT NOT NULL,
		CONSTRAINT fk5 FOREIGN KEY (BookID) REFERENCES book(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
		CONSTRAINT fk6 FOREIGN KEY (BranchID) REFERENCES library_branch(BranchID) ON UPDATE CASCADE ON DELETE CASCADE);
        
        
CREATE TABLE book_authors (
		AuthorID INT PRIMARY KEY,
		BookID INT NOT NULL,
		AuthorName VARCHAR(50) NOT NULL,
		CONSTRAINT fk7 FOREIGN KEY (BookID) REFERENCES book(BookID) ON UPDATE CASCADE ON DELETE CASCADE);
        
        
        
INSERT INTO PUBLISHER VALUES ('DAW Books','375 Hudson Street, New York, NY 10014','99887766655'),
		('Viking','375 Hudson Street, New York, NY 10014','9876789650'),
		('Signet Books','375 Hudson Street, New York, NY 10014','8877996600'),
		('Chilton Books','Not Available','7878968790'),
		('George Allen & Unwin','83 Alexander Ln, Crows Nest NSW 2065, Australia','9448867589'),
		('Alfred A. Knopf','The Knopf Doubleday Group Domestic Rights, 1745 Broadway, New York, NY 10019','9988675645'),		
		('Bloomsbury','Bloomsbury Publishing Inc., 1385 Broadway, 5th Floor, New York, NY 10018','8787767665'),
		('Shinchosa','Oga Bldg. 8, 2-5-4 Sarugaku-cho, Chiyoda-ku, Tokyo 101-0064 Japan','9089877656'),
		('Harper and Row','HarperCollins Publishers, 195 Broadway, New York, NY 10007','8899343423'),
		('Pan Books','175 Fifth Avenue, New York, NY 10010','7867776655'),
		('Chalto & Windus','375 Hudson Street, New York, NY 10014','7788989000'),
		('Harcourt Brace Jovanovich','3 Park Ave, New York, NY 10016','8765432109'),
		('W.W. Norton',' W. W. Norton & Company, Inc., 500 Fifth Avenue, New York, New York 10110','9345678902'),
		('Scholastic','557 Broadway, New York, NY 10012','8234567890'),
		('Bantam','375 Hudson Street, New York, NY 10014','9876543210'),
		('Picador USA','175 Fifth Avenue, New York, NY 10010','9898765432');
        
        
INSERT INTO book VALUES 
		(1,'The Name of the Wind', 'DAW Books'),
		(2,'It', 'Viking'),
		(3,'The Green Mile', 'Signet Books'),
		(4,'Dune', 'Chilton Books'),
		(5,'The Hobbit', 'George Allen & Unwin'),
		(6,'Eragon', 'Alfred A. Knopf'),
		(7,'A Wise Mans Fear', 'DAW Books'),
		(8,'Harry Potter and the Philosophers Stone', 'Bloomsbury'),
		(9,'Hard Boiled Wonderland and The End of the World', 'Shinchosa'),
		(10,'The Giving Tree', 'Harper and Row'),
		(11,'The Hitchhikers Guide to the Galaxy', 'Pan Books'),
		(12,'Brave New World', 'Chalto & Windus'),
		(13,'The Princess Bride', 'Harcourt Brace Jovanovich'),
		(14,'Fight Club', 'W.W. Norton'),
		(15,'Holes', 'Scholastic'),
		(16,'Harry Potter and the Chamber of Secrets', 'Bloomsbury'),
		(17,'Harry Potter and the Prisoner of Azkaban', 'Bloomsbury'),
		(18,'The Fellowship of the Ring', 'George Allen & Unwin'),
		(19,'A Game of Thrones', 'Bantam'),
		(20,'The Lost Tribe', 'Picador USA');
        
        
        INSERT INTO library_branch VALUES
		(100,'Sharpstown','32 Corner Road, New York, NY 10012'),
		(101,'Central','491 3rd Street, New York, NY 10014'),
		(102,'Saline','40 State Street, Saline, MI 48176'),
		(103,'Ann Arbor','101 South University, Ann Arbor, MI 48104');
        
        INSERT INTO borrower VALUES
		(300,'Joe Smith','1321 4th Street, New York, NY 10014','9090876543'),
		(301,'Jane Smith','1321 4th Street, New York, NY 10014','8787676756'),
		(302,'Tom Li','981 Main Street, Ann Arbor, MI 48104','9089898978'),
		(303,'Angela Thompson','2212 Green Avenue, Ann Arbor, MI 48104','7878674532'),
		(304,'Harry Emnace','121 Park Drive, Ann Arbor, MI 48104','7845678934'),
		(305,'Tom Haverford','23 75th Street, New York, NY 10014','93456789023'),
		(306,'Haley Jackson','231 52nd Avenue New York, NY 10014','9923456789'),
		(307,'Michael Horford','653 Glen Avenue, Ann Arbor, MI 48104','8934567890');
        
        
        INSERT INTO book_loans VALUES
		(1,'1',100,'300','1/1/18','2/2/18'),
		(2,'2',100,'300','1/1/18','2/2/18'),
		(3,'3',100,'300','1/1/18','2/2/18'),
		(4,'4',100,'300','1/1/18','2/2/18'),
		(5,'5',100,'302','1/3/18','2/3/18'),
		(6,'6',100,'302','1/3/18','2/3/18'),
		(7,'7',100,'302','1/3/18','2/3/18'),
		(8,'8',100,'302','1/3/18','2/3/18'),
		(9,'9',100,'302','1/3/18','2/3/18'),
		(10,'11',100,'302','1/3/18','2/3/18'),
		(11,'12',101,'305','12/12/17','1/12/18'),
		(12,'10',101,'305','12/12/17','1/12/17'),
		(13,'20',101,'305','2/3/18','3/3/18'),
		(14,'18',101,'305','1/5/18','2/5/18'),
		(15,'19',101,'305','1/5/18','2/5/18'),
		(16,'19',101,'300','1/3/18','2/3/18'),
		(17,'11',101,'306','1/7/18','2/7/18'),
		(18,'1',101,'306','1/7/18','2/7/18'),
		(19,'2',101,'300','1/7/18','2/7/18'),
		(20,'3',101,'300','1/7/18','2/7/18'),
		(21,'5',101,'305','12/12/17','1/12/18'),
		(22,'4',102,'303','1/9/18','2/9/18'),
		(23,'7',102,'302','1/3/18','2/3/18'),
		(24,'17',102,'302','1/3/18','2/3/18'),
		(25,'16',102,'304','1/3/18','2/3/18'),
		(26,'15',102,'304','1/3/18','2/3/18'),
		(27,'15',102,'307','1/3/18','2/3/18'),
		(28,'14',102,'304','1/3/18','2/3/18'),
		(29,'13',102,'307','1/3/18','2/3/18'),
		(30,'13',102,'302','1/3/18','2/3/18'),
		(31,'19',102,'302','12/12/17','1/12/18'),
		(32,'20',103,'303','1/3/18','2/3/18'),
		(33,'1',103,'302','1/12/18','2/12/18'),
		(34,'3',103,'307','1/3/18','2/3/18'),
		(35,'18',103,'307','1/3/18','2/3/18'),
		(36,'12',103,'302','1/4/18','2/4/18'),
		(37,'11',103,'303','1/15/18','2/15/18'),
		(38,'9',103,'303','1/15/18','2/15/18'),
		(39,'7',103,'307','1/1/18','2/2/18'),
		(40,'4',103,'303','1/1/18','2/2/18'),
		(41,'1',103,'303','2/2/17','3/2/18'),
		(42,'20',103,'303','1/3/18','2/3/18'),
		(43,'1',103,'302','1/12/18','2/12/18'),
		(44,'3',103,'307','1/13/18','2/13/18'),
		(45,'18',103,'307','1/13/18','2/13/18'),
		(46,'12',103,'302','1/14/18','2/14/18'),
		(47,'11',103,'303','1/15/18','2/15/18'),
		(48,'9',103,'303','1/15/18','2/15/18'),
		(49,'7',103,'307','1/19/18','2/19/18'),
		(50,'4',103,'303','1/19/18','2/19/18'),
		(51,'1',103,'303','1/22/18','2/22/18');
        
        
        INSERT INTO book_copies	VALUES
		(1,'1',100,'5'),
		(2,'2',100,'5'),
		(3,'3',100,'5'),
		(4,'4',100,'5'),
		(5,'5',100,'5'),
		(6,'6',100,'5'),
		(7,'7',100,'5'),
		(8,'8',100,'5'),
		(9,'9',100,'5'),
		(10,'10',100,'5'),
		(11,'11',100,'5'),
		(12,'12',100,'5'),
		(13,'13',100,'5'),
		(14,'14',100,'5'),
		(15,'15',100,'5'),
		(16,'16',100,'5'),
		(17,'17',100,'5'),
		(18,'18',100,'5'),
		(19,'19',100,'5'),
		(20,'20',100,'5'),
		(21,'1',101,'5'),
		(22,'2',101,'5'),
		(23,'3',101,'5'),
		(24,'4',101,'5'),
		(25,'5',101,'5'),
		(26,'6',101,'5'),
		(27,'7',101,'5'),
		(28,'8',101,'5'),
		(29,'9',101,'5'),
		(30,'10',101,'5'),
		(31,'11',101,'5'),
		(32,'12',101,'5'),
		(33,'13',101,'5'),
		(34,'14',101,'5'),
		(35,'15',101,'5'),
		(36,'16',101,'5'),
		(37,'17',101,'5'),
		(38,'18',101,'5'),
		(39,'19',101,'5'),
		(40,'20',101,'5'),
		(41,'1',102,'5'),
		(42,'2',102,'5'),
		(43,'3',102,'5'),
		(44,'4',102,'5'),
		(45,'5',102,'5'),
		(46,'6',102,'5'),
		(47,'7',102,'5'),
		(48,'8',102,'5'),
		(49,'9',102,'5'),
		(50,'10',102,'5'),
		(51,'11',102,'5'),
		(52,'12',102,'5'),
		(53,'13',102,'5'),
		(54,'14',102,'5'),
		(55,'15',102,'5'),
		(56,'16',102,'5'),
		(57,'17',102,'5'),
		(58,'18',102,'5'),
		(59,'19',102,'5'),
		(60,'20',102,'5'),
		(61,'1',103,'5'),
		(62,'2',103,'5'),
		(63,'3',103,'5'),
		(64,'4',103,'5'),
		(65,'5',103,'5'),
		(66,'6',103,'5'),
		(67,'7',103,'5'),
		(68,'8',103,'5'),
		(69,'9',103,'5'),
		(70,'10',103,'5'),
		(71,'11',103,'5'),
		(72,'12',103,'5'),
		(73,'13',103,'5'),
		(74,'14',103,'5'),
		(75,'15',103,'5'),
		(76,'16',103,'5'),
		(77,'17',103,'5'),
		(78,'18',103,'5'),
		(79,'19',103,'5'),
		(80,'20',103,'5');


INSERT INTO book_authors VALUES
		(200,'1','Patrick Rothfuss'),
		(201,'2','Stephen King'),
		(202,'3','Stephen King'),
		(203,'4','Frank Herbert'),
		(204,'5','J.R.R. Tolkien'),
		(205,'6','Christopher Paolini'),
		(206,'6','Patrick Rothfuss'),
		(207,'8','J.K. Rowling'),
		(208,'9','Haruki Murakami'),
		(209,'10','Shel Silverstein'),
		(210,'11','Douglas Adams'),
		(211,'12','Aldous Huxley'),
		(212,'13','William Goldman'),
		(213,'14','Chuck Palahniuk'),
		(214,'15','Louis Sachar'),
		(215,'16','J.K. Rowling'),
		(216,'17','J.K. Rowling'),
		(217,'18','J.R.R. Tolkien'),
		(218,'19','George R.R. Martin'),
		(219,'20','Mark Lee');


	SELECT * FROM publisher;
	SELECT * FROM BOOK;
	SELECT * FROM library_branch;
	SELECT * FROM borrower;
	SELECT * FROM book_loans;
	SELECT * FROM book_copies;
	SELECT * FROM book_authors;
    
    
    
    -- QUERY
/* #1- How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"? */

CREATE VIEW V1 AS
SELECT BOOKID
FROM BOOK B
WHERE Title='The Lost Tribe';

CREATE VIEW V2 AS
SELECT BRANCHID
FROM library_branch
WHERE BranchName='Sharpstown';



SHOW CREATE VIEW V1;

Show create view v2;

SELECT * FROM v1;

select * from v2;

-- 1) How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"

SELECT No_Of_Copies
FROM book_copies BC,V1,V2
WHERE V1.BookID=BC.BookID AND V2.BranchID=BC.BranchID;

-- 2)- How many copies of the book titled "The Lost Tribe" are owned by each library branch? */


SELECT No_Of_Copies,BranchID
FROM BOOK B,book_copies BC
WHERE B.BookID=BC.BookID AND B.Title='The Lost Tribe' 
GROUP BY BranchID,No_Of_Copies;


-- 3) Retrieve the names of all borrowers who do not have any books checked out

SELECT BorrowerName
FROM borrower B
WHERE CardNo NOT IN(SELECT CardNo FROM book_loans);


-- 4) For each book that is loaned out from the "Sharpstown" branch and whose DueDate is 2/3/18, retrieve the book title,
-- the borrower's name, and the borrower's address.

SELECT DISTINCT(B.BorrowerName),B.BorrowerAddress
FROM library_branch LB, borrower B,book_loans BL
WHERE LB.BranchName='Sharpstown' AND LB.BranchID=BL.BranchID AND BL.CardNo=B.CardNo AND BL.DueDate='2/3/18';


-- 5) For each library branch, retrieve the branch name and the total number of books loaned out from that branch

SELECT BranchName,COUNT(LB.BranchID) AS total_number_of_books_loaned
FROM library_branch LB, book_loans BL
WHERE BL.BranchID=LB.BranchID
GROUP BY BranchName;


-- 6) Retrieve the names, addresses, and number of books checked out for all borrowers who have more than five books checked out.


SELECT B.BorrowerName,B.BorrowerAddress, CardNo
FROM borrower B
WHERE CardNo IN ( SELECT CardNo
					FROM book_loans BL
					GROUP BY CardNo
					HAVING COUNT(CARDNO)>5);
                    
                    
-- 7) For each book authored by "Stephen King", retrieve the title and the number of copies owned by the library branch whose name is "Central".

SELECT        Title, No_Of_Copies 
FROM   (((BOOK_AUTHORS NATURAL JOIN BOOK) NATURAL JOIN 
BOOK_COPIES) NATURAL JOIN LIBRARY_BRANCH)WHERE 
AuthorName='Stephen King' AND BranchName='Central';
