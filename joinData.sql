DATABASE: joins
TABLES: customers, orders

1. -- Find  the person who spent the most money.
    SELECT CONCAT(first_name, " ", last_name) AS "Name", order_date AS "Date", SUM(amount) AS "Amount"
    FROM customers JOIN orders ON customers.id = orders.customer_id
    GROUP BY customers.id ORDER BY SUM(amount) DESC LIMIT 1;
    
2. -- Find the total spent by every customer. If it says they spent NULL, make it 0.
    SELECT CONCAT(first_name, " ", last_name) AS "Name",
        CASE
            WHEN SUM(amount) IS NULL THEN 0
            ELSE SUM(amount)
        END AS "Amount"
    FROM customers LEFT JOIN orders ON customers.id = orders.customer_id
    GROUP BY customers.id ORDER BY SUM(amount) DESC;
    
    -- OR
    
    SELECT CONCAT(first_name, " ", last_name) AS "Name", IFNULL(SUM(amount), 0) AS "Amount"
    FROM customers LEFT JOIN orders ON customers.id = orders.customer_id
    GROUP BY customers.id ORDER BY SUM(amount) DESC;
        
   
   
--------------------------------------- JOINS EXERCISE --------------------------------------- 
        
3. Make the following schema:
    
        Students: id, first_name
        Papers: title, grade, student_id references id
        
        -- ANSWER
        
        CREATE TABLE students(
            id INT AUTO_INCREMENT PRIMARY KEY,
            first_name VARCHAR(100)
        );
        
        CREATE TABLE papers(
            title VARCHAR(100),
            grade INT,
            student_id INT,
            FOREIGN KEY(student_id) REFERENCES students(id)
            ON DELETE CASCADE
        );
        
        
4. Print a table that shows first name of each student with their papers in desc order by grade (RIGHT JOIN ALSO WORKS).

            SELECT first_name, title, grade 
            FROM students JOIN papers ON students.id = papers.student_id
            ORDER BY grade DESC;
            
            
5. Print a table that show first_name, title, grade and also includes the null values;

            SELECT first_name, title, grade 
            FROM students LEFT JOIN papers ON students.id = papers.student_id;
        
        
6. Print the above exercise except handle the NULL for grade (which should be 0) and title (which should be "Missing").

            SELECT first_name, 
                   IFNULL(title, "MISSING") AS "Title", 
                   IFNULL(grade, 0) AS "Grade" 
            FROM students LEFT JOIN papers ON students.id = papers.student_id;
            
            
7. Print each students average score.

            SELECT first_name AS "Name", 
                   IFNULL(AVG(grade), 0) AS "Average" 
            FROM students LEFT JOIN papers ON students.id = papers.student_id 
            GROUP BY students.id 
            ORDER BY AVG(grade) DESC;
            
            
8. Print same thing as above except indicate if a student is passing or failing.
            
            SELECT first_name AS "Name", 
                   IFNULL(AVG(grade),0) AS "Average",
                CASE
                    WHEN AVG(grade) < 75 THEN "FAILING"
                    WHEN AVG(grade) IS NULL THEN "FAILING"
                    ELSE "PASSING"
                END AS "Passing Status"
            FROM students LEFT JOIN papers ON students.id = papers.student_id 
            GROUP BY students.id 
            ORDER BY Average DESC;