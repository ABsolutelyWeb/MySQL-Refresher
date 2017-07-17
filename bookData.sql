CREATE TABLE books (
    book_id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(100),
    author_fname VARCHAR(100),
    author_lname VARCHAR(100),
    released_year INT,
    stock_quantity INT,
    pages INT,
    PRIMARY KEY(book_id)
);

INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES
('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526),
('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);


SELECT CONCAT(SUBSTRING(title, 1, 10), "...") AS "short title", 
       CONCAT(author_lname, ", ", author_fname) AS "author", 
       CONCAT(stock_quantity, " in stock") AS "quantity"
FROM books;


1. SELECT title AS Title FROM books WHERE title LIKE "%Stories%";                                          <--- Select the book where the title has "Stories" in it.
2. SELECT title as Title, pages AS Pages FROM books ORDER BY pages DESC LIMIT 1;                           <--- Select the book with the most pages.
3. SELECT CONCAT(title, " - ", released_year) AS summary FROM books ORDER BY released_year DESC LIMIT 3;   <--- Select the top 3 most recent books.
4. SELECT title as Title, author_lname AS "Last Name" FROM books WHERE author_lname LIKE "% %";            <--- Select all books where the author has a space in their last name.
5. SELECT title AS Title, released_year as "Year of Release", stock_quantity as "Stock" 
   FROM books ORDER BY stock_quantity ASC LIMIT 3;                                                         <--- Select the 3 books with the lowest stock.
6. SELECT title as Title, author_lname as "Author Last Name" FROM books ORDER BY author_lname, title;      <--- Select title and last name and sort it by author_lname and then title.
7. SELECT DISTINCT CONCAT("MY FAVORITE AUTHOR IS ", UPPER(author_fname), " ", UPPER(author_lname)) as "yell" FROM books  
   ORDER BY author_lname ASC;                                                                              <--- Print "MY FAVORITE AUTHOR IS " and then the distinct author names.