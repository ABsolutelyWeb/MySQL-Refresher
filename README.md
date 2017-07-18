BASIC COMMANDS:

1. To make a database: 
   
            CREATE DATABASE <name>;


2. To drop a database:
            
            DROP DATABASE <name>;


3. To choose the database to use:

            USE <table_name>;
            
            
4. To know what database we are using:

            SELECT database();
            
            
5. To create a generic table with generic data types:

            CREATE TABLE table_name
                (
                    column_name data_type,
                    column_name data_type
                );
                
                
6. How to know if the table and fields you created worked:
    
            SHOW TABLES;  <--- ensure that the correct database is being used.
            SHOW COLUMNS FROM <table_name>;
                    OR
            DESC <table_name>;


7. How to delete a table:
    
            DROP TABLE <table_name>;


8. How to insert data into a table:

            INSERT INTO table_name (field1, field2)
            VALUES (value1, value2);
            
            
9. How to insert MULTIPLE data into a table:

            INSERT INTO table_name (field1, field2)
            VALUES (value1, value2),
                   (value3, value4),
                   (value5, value6);
                   
                   
10. How to figure out what warnings we got:

            SHOW WARNINGS;
   
            
11. How to make it so table values cannot be null:

            CREATE TABLE table_name (
                field1 datatype() NOT NULL,
                field2 data_type() NOT NULL);
                
                
12. How to make it so we have a pre-defined default value:

            CREATE TABLE table_name (
                field1 datatype() DEFAULT default_value1,
                field2 datatype() DEFAULT default_value2);
            

13. How to add primary key (or unique identifier):

            CREATE TABLE table_name (
                field1 INT NOT NULL,
                field2 datatype(),
                PRIMARY KEY (field1));
                
                
14. How to add primary key without having to manually specify the it during INSERT statements. 

            CREATE TABLE table_name (
                field1 INT NOT NULL AUTO_INCREMENT,
                field2 datatype(),
                PRIMARY KEY (field1));
                                                            
        OR

            CREATE TABLE table_name (
                field1 INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                field2 datatype()
                );
                

15. Update entries:
            
            UPDATE table_name SET field1 = value WHERE field2 = value1;


16. Delete entries / entry:

            DELETE FROM table_name WHERE field1 = value1;
            DELETE FROM table_name;   <--- deletes everything


17. Aliases:

            SELECT id AS ID FROM cats WHERE age=10;  <--- Formats "id" as "ID."
            
            
18. Running an sql file:

            source file.sql  <--- mysql-ctl cli
            
            
19. Concat --> Pass in multiple arguments and it will combine them.

            SELECT CONCAT (column1, ' ', column2) FROM table; <-- Ex. Jim Morrison
            
            
20. CONCAT_WS <--- enter what you want each field to be separated by.

            SELECT CONCAT_WS (" - ", column1, column2) FROM table; <-- Ex. Jim Morrison
            
            
21. SUBSTRING <--- pick specific characters you want.

            SELECT SUBSTRING("Hello world", 1, 4); <--- pick the 1st to 4th character. Prints out "Hell"
            SELECT SUBSTRING("Hello world", 7);    <--- Prints index 7 and beyond.
            SELECT SUBSTRING("Hello world", -3);   <--- Starts at end of string and goes to 3rd last character and prints everything beyond.
            
            SELECT SUBSTRING(title, 1, 10) FROM table_name; <--- where "title" is a column of strings or VARCHARs.
            
                How to add a "..." after each entry:
                
                SELECT CONCAT(SUBSTRING(title, 1, 10), "...") FROM table_name;
                
                
22. REPLACE <--- Replaces certain parts of a string.

            SELECT REPLACE("Hello World", "Hell", "%$#@"); <--- replaces "Hell" in "Hello World" with "%$#@"
            SELECT REPLACE(title, "e", "3") AS "Book Title" FROM books; <--- replaces every "e" in the title column with "3"
            
            
23. REVERSE <--- Reverse a string.

            SELECT REVERSE("Hello World");
            SELECT REVERSE(table_column); <--- reverse every entry in a column.
            
            
24. CHAR_LENGTH <--- Tells you how many characters exist in a given string.

            SELECT CHAR_LENGTH(column) FROM table;
            SELECT CHAR_LENGTH("Book");
            
            
25. UPPER() and LOWER() <--- Change a string's case.

            SELECT UPPER(column) FROM table;
            SELECT UPPER("Hello"); <--- Uppercase everything.
            
            LOWER() works the same way as above.
            
            
26. DISTINCT <-- Find all uniques.

            SELECT DISTINCT column FROM table_name;
            
            
27. ORDER BY <--- sorting results

            SELECT * FROM table_name ORDER BY column DESC/ASC <-- order by a column in ascending or descending order. Ascending is default.
            SELECT column1, column2, column3 FROM table_name ORDER BY 2 <-- Order by the 2nd column.
            SELECT column1, column2 FROM table_name ORDER BY column1, column2; <-- Sort by 2 different columns.
            
            
28. LIMIT <argument> <--- Limit by whatever; comes last in the query.

            SELECT column FROM books LIMIT 3; <--- show only first 3 results.
            SELECT column FROM books LIMIT 2, 5; <--- Range
            
            
29. LIKE <--- WHERE is useful in finding exact matches. But what if we wanted to find all Harry Potter books, for example?
              Then we would use LIKE.
              
              For  example, say we are looking for a book, but don't remember the title. We know the first name is "Alex."
              We can attempt to find the book with the following query:
              
              SELECT * FROM books WHERE author_fname LIKE "%Raymond%"; <--- Find every book written by someone with "Raymond" in their first name.
              SELECT * FROM books WHERE author_fname LIKE "Ray%"; <--- Find every book written by someone whose name starts with "Ray" in their first name.
              SELECT * FROM books WHERE author_fname LIKE "%mond"; <--- Find every book written by someone whose name ends with "mond" in their first name.
              SELECT * FROM books WHERE author_fname LIKE "____"; <--- 4 underscores. Each underscore specifies ONE character. So we are looking for a name that is 4 characters long.
              SELECT * FROM books WHERE author_fname LIKE "%"; <--- Gives us everything.
              
              How would we select something that explicitly has a % sign or underscore in it?
              
              SELECT * FROM books WHERE author_fname LIKE "%\%%"; <--- use escape character.
              SELECT * FROM books WHERE author_fname LIKE "%\_%";
                                                 
            
30. COUNT <--- Count all entries and return a number.

            SELECT COUNT(*) FROM table_name;
            SELECT COUNT(distinct column_name) FROM table_name;
            SELECT COUNT(distinct column_name, column_name1) FROM table_name; <--- For if you want to find distinct first and last names.
            SELECT COUNT(title) FROM books WHERE title LIKE "%the%";          <--- Count all titles that have "the" in the title.
            
            
31. GROUP BY <--- Summarizes identical data into single, "super" rows. e.g. Take all books and group them by release.           
            
            SELECT author_lname, COUNT(*) FROM books GROUP BY author_lname, author_fname; <--- Count how many books each author has written. Basically counts subrows. COUNT(*) is referring to the grouped rows. 
            
            
32. MIN / MAX <--- Find the min or max values.

            SELECT MIN(released_year) FROM books;
            

33. SUBQUERIES: What if you want to know what book has the min / max page count?
            
            SELECT * FROM books WHERE pages = (SELECT Max(pages) FROM books);
            
            OR
            
            SELECT * FROM books ORDER BY pages ASC LIMIT 1;
            
            
34. MIN / MAX with GROUP BY: Find the year each author published their first book.   

            SELECT author_fname, author_lname, MIN(released_year) FROM books GROUP BY author_lname, author_fname;
            
            
35. SUM <--- Sums all values in a column or database.

            SELECT SUM(pages) FROM books;
            
            Sum up all pages each author has written.
            
                SELECT author_fname, author_lname, SUM(pages) FROM books GROUP BY author_fname, author_lname;
            
            
36. AVG or average.

            Find average released_year across all books.
            
                SELECT AVG(released_year) FROM books;
            
            Find average released_year per author.
            
                SELECT author_fname, author_lname, AVG(released_year) FROM books GROUP BY author_fname, author_lname;
            
            Find avg stock quantity for books released in same year.
                
                SELECT distinct released_year, AVG(stock_quantity) FROM books GROUP BY released_year;
            
            
37. CHAR <--- fixed length that stores text. e.g. CHAR(3) <--- only 3 characters are allowed. Can be from 0 to 255.
                                                          <--- Say we designate CHAR(10), but only use 5 characters. It will then have 5 spaces to the right of the string i.e. "right-padded."
                                                          <--- CHAR is faster than VARCHAR for fixed length text such as state abbreviations, yes/no and true/false flags, and M/F.
            CREATE TABLE dogs (name char(5), breed VARCHAR(10));
            INSERT INTO dogs(name, breed) VALUES ("Bob", "beagle"), ("Robby", "corgie"), ("Princess Jane", "Retriever");  <--- Princess Jane will yield a warning since it exceeds char value. Name will be truncated.
            
            
38. Number types: 
            INT 
            DECIMAL (i.e. DECIMAL(5,2) means we will have max number of digits of 5, including decimal points as well as 2 digits after decimal point. So any 3 digit number with 2 digit decimal would work here.)
                                        -- So if you have DECIMAL(5,2) and enter a number like 2342454235345 then you will be defaulted to 999.99 since that is the max possible given the constraints.
                                        -- If you have DECIMAL(5,2) and enter 298.9999, it will ditch the last two decimal places and round up to 299.00
            FLOAT (7 digits) & DOUBLE (15 digits) will store larger numbers using less space, but at the cost of precision.
            
            
39. Dates and Times:
            
            DATE      <--- Values with a date, but no time. Format: "YYYY-MM-DD"
            TIME      <--- Values with time, but no date.   Format: "HH:MM:SS"
            DATETIME  <--- Values with date AND time.       Format: "YYYY-MM-DD HH:MM:SS"
            
            CREATE TABLE people (name VARCHAR(100), birthdate DATE, birthtime TIME, birthdt DATETIME);
            INSERT INTO people (name, birthdate, birthtime, birthdt) VALUES ("Padma", "1983-11-11", "10:07:35", "1983-11-11 10:07:35");
            
            
40. CURDATE, CURTIME, & NOW:
            
            SELECT CURDATE() - Gives current date.
            SELECT CURTIME() - Gives current time.
            SELECT NOW()     - Gives current datetime.
            
            there are many, many more. Check documentation.
            
            INSERT INTO people(name, birthdate, birthtime, birthdt) VALUES ("Gary", CURDATE(), CURTIME(), NOW());
            
            
41. Formatting dates / times:

            SELECT name, DAY(birthdate) FROM people;
            SELECT name, CONCAT(DAYNAME(birthdate), ", ", MONTHNAME(birthdate), " ", DAY(birthdate), ", ", YEAR(birthdate)) FROM people;
                    - Output format: Friday, November 11, 1983 
                    
                    OR
                    
            SELECT name, DATE_FORMAT(birthdt, "%W %M %Y at %h:%m:%s") FROM people;       
                    - Output format: Friday November 1983 at 10:11:35 
                    
TABLE FOR FORMATTING DATE:
            
            
Specifier	Description
%a	Abbreviated weekday name (Sun..Sat)
%b	Abbreviated month name (Jan..Dec)
%c	Month, numeric (0..12)
%D	Day of the month with English suffix (0th, 1st, 2nd, 3rd, …)
%d	Day of the month, numeric (00..31)
%e	Day of the month, numeric (0..31)
%f	Microseconds (000000..999999)
%H	Hour (00..23)
%h	Hour (01..12)
%I	Hour (01..12)
%i	Minutes, numeric (00..59)
%j	Day of year (001..366)
%k	Hour (0..23)
%l	Hour (1..12)
%M	Month name (January..December)
%m	Month, numeric (00..12)
%p	AM or PM
%r	Time, 12-hour (hh:mm:ss followed by AM or PM)
%S	Seconds (00..59)
%s	Seconds (00..59)
%T	Time, 24-hour (hh:mm:ss)
%U	Week (00..53), where Sunday is the first day of the week; WEEK() mode 0
%u	Week (00..53), where Monday is the first day of the week; WEEK() mode 1
%V	Week (01..53), where Sunday is the first day of the week; WEEK() mode 2; used with %X
%v	Week (01..53), where Monday is the first day of the week; WEEK() mode 3; used with %x
%W	Weekday name (Sunday..Saturday)
%w	Day of the week (0=Sunday..6=Saturday)
%X	Year for the week where Sunday is the first day of the week, numeric, four digits; used with %V
%x	Year for the week, where Monday is the first day of the week, numeric, four digits; used with %v
%Y	Year, numeric, four digits
%y	Year, numeric (two digits)
%%	A literal % character
%x	x, for any “x” not listed above
                    
                    
42. Date Math:

            DATEDIFF figures out the difference in days between two dates. Returns an int.
            
                SELECT DATEDIFF(NOW(), birthdate) FROM people;  <-- useful with CONCAT to post "Posted X days ago."
                
            DATE_ADD: specify date, INTERVAL [amount to increment]. Useful for telling customers when their subscription expires.
                
                For example: SELECT DATE_ADD("2010-12-31 23:59:59", INTERVAL 1 DAY);  <--- adds one day to the date
            
            
43. Timestamps:

            CREATE TABLE comments (content VARCHAR(100), created_at TIMESTAMP DEFAULT NOW());
            INSERT INTO comments (content) VALUES ("Hello, world!");
            
            How to make timestamps change upon update:
            
            CREATE TABLE comments2 (content VARCHAR(100), created_at TIMESTAMP DEFAULT NOW() ON UPDATE CURRENT_TIMESTAMP);
            INSERT INTO comments2 (content) VALUES ("Blah");
            UPDATE comments2 SET content="Blah2" WHERE content="Blah";    <--- Timestamp will reflect when row is updated.
            
            
44. CURDATE() vs NOW()? NOW deals with date and time. CURDATE deals with just date.            
            
            
            
45. Not Equal: != and &&

            SELECT title, released_year FROM books WHERE released_year != 2017 && released_year !=2003;
            
            
46. NOT LIKE

            SELECT title FROM books WHERE title NOT LIKE "%the%"; <-- Find all entries that dont contain "the."
            
            
47. GREATER / LESS THAN:

            SELECT title, pages FROM books WHERE pages >= 400;
            SELECT title, pages FROM books WHERE pages <= 200;
            
            SELECT 99 > 1  <--- Yields a 1 for true.
            SELECT 99 < 1  <--- Yields a 0 for false.
            
            
48. &&    Find all books published by Dave Eggers after 2010.

            SELECT title, CONCAT(author_fname, " ", author_lname), released_year FROM books WHERE author_fname = "Dave" && author_lname = "Eggers" && released_year > 2010;
            
            
49. OR / ||

            