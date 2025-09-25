
DROP DATABASE IF EXISTS TablesDB;
CREATE DATABASE TablesDB;
USE TablesDB;


CREATE TABLE Author (
  AuthorID     INT PRIMARY KEY AUTO_INCREMENT,
  AuthorName   VARCHAR(100) NOT NULL,
  AuthorEmail  VARCHAR(150) UNIQUE
);


CREATE TABLE FictionBook (
  BookID           INT PRIMARY KEY AUTO_INCREMENT,
  BookTitle        VARCHAR(200) NOT NULL,
  AuthorID         INT NOT NULL,
  PublicationDate  DATE NOT NULL,
  CONSTRAINT fk_FictionBook_Author
    FOREIGN KEY (AuthorID) REFERENCES Author(AuthorID)
);


INSERT INTO Author (AuthorID, AuthorName, AuthorEmail)
VALUES (1, 'Thabo Bless', 'thabo@yahoo.com');

INSERT INTO FictionBook (BookID, BookTitle, AuthorID, PublicationDate)
VALUES (1, 'Into the Darkness', 1, '2025-02-14');

SELECT * FROM Author;
SELECT * FROM FictionBook;


SELECT 
  b.BookID,
  b.BookTitle,
  b.PublicationDate,
  a.AuthorName,
  a.AuthorEmail
FROM FictionBook b
JOIN Author a ON a.AuthorID = b.AuthorID;
