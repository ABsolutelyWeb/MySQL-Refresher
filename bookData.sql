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
   
8. -- Print the number of books in the database.   
        SELECT COUNT(title) FROM books;
        
   -- Print how many books were released each year.
        SELECT distinct released_year, COUNT(title) FROM books GROUP BY released_year;
        
9. -- Print total number of books in stock.
        SELECT SUM(stock_quantity) FROM books;
        
   -- Find avg released_year for each author.
        SELECT CONCAT(author_fname, " ", author_lname) AS "Author",
               AVG(released_year)
        FROM books GROUP BY author_fname, author_lname;
        
10. -- Find full name of author who wrote the longest book.
        SELECT CONCAT(author_fname, " ", author_lname) AS "Author", pages FROM books ORDER BY pages DESC LIMIT 1;
        
        -- OR
        
        SELECT CONCAT(author_fname, " ", author_lname) AS "Author", pages FROM books WHERE pages = (SELECT MAX(pages) FROM books);
        
11. SELECT distinct released_year AS "Year",
           COUNT(title) AS "# Books",
           AVG(pages) AS "Average Pages"
    FROM books GROUP BY released_year;
        
12. -- What's a good use for CHAR?
    ANSWER: For fixed length strings. For example, if you know the string has to be M or F, state abbreviations that are 2 character lengths, etc. So if you have a 
            "states" field, then you should use CHAR(2) for values like "CA", "AZ", etc.
            
13. -- FILL IN THE BLANKS:
    CREATE TABLE inventory (
        item_name VARCHAR(100),
        price DECIMAL(8,2),
        quantity INT
    );
    
14. -- What is the difference between DATETIME and TIMESTAMP?
    ANSWER: DATETIME uses more memory than TIMESTAMP (around twice more). Timestamps have a limitation as to how low they can go while DATETIME can be ANY date and ANY time ever. 
            TIMESTAMPs are also meant to be update-able for metadata.
            
15. -- Print out current time:
    SELECT CURTIME();
    
16. -- Print out the current date:
    SELECT CURDATE();
    
17. -- Print current day number of the week.
    SELECT DAYOFWEEK(NOW());
    
18. -- Print out current day name of the week.
    SELECT DAYNAME(NOW());
    
19. -- Print out current date in mm/dd/yyyy.
    SELECT DATE_FORMAT(CURDATE(), "%m/%d/%Y");
    
20. -- Print current day and time using "January 2nd at 3:15" or "April 1st at 10:18"
    SELECT DATE_FORMAT(NOW(), "%M %D at %h:%i");
    
21. -- Create a Tweets table that stores Tweet content, username, time it was created.
    CREATE TABLE tweets (content VARCHAR(140), username VARCHAR(15), created_at TIMESTAMP DEFAULT NOW());
    INSERT INTO tweets (content, username) VALUES ("This sucks!", "Cherry");
    
    
    