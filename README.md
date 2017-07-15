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
            
            
26. 
            
            
            
            
            


                                                 
            