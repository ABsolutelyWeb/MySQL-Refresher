-- Many to many data

CREATE TABLE reviewers(
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100)
);


CREATE TABLE series(
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100),
    released_year YEAR(4),
    genre VARCHAR(100)
);


CREATE TABLE reviews(
    id INT AUTO_INCREMENT PRIMARY KEY,
    rating DECIMAL(2,1),
    series_id INT,
    reviewer_id INT,
    FOREIGN KEY(series_id) REFERENCES series(id),
    FOREIGN KEY(reviewer_id) REFERENCES reviewers(id)
);




-- 1. Show title of all shows with their ratings

        SELECT title, rating
        FROM series JOIN reviews ON series.id = reviews.series_id
        ORDER BY title ASC;
        
        
-- 2. Show the every series' average rating.

        SELECT title, AVG(rating) AS "avg_rating"
        FROM series JOIN reviews ON series.id = reviews.series_id
        GROUP BY series.id
        ORDER BY avg_rating ASC;
        
        
-- 3. Show first name, last name, and every rating.

        SELECT first_name, last_name, rating
        FROM reviewers JOIN reviews ON reviewers.id = reviews.reviewer_id;
        
        
-- 4. Print the titles of all unreviewed series.

        SELECT title AS "unreviewed_series"
        FROM series LEFT JOIN reviews ON series.id = reviews.series_id
        WHERE reviews.rating IS NULL;
        
        
-- 5. Print avg ratings for each genre. New fcn ROUND means to round the decimals
--    to 2.     

        SELECT 
            genre, 
            ROUND(
                AVG(rating), 
                2
            ) AS "avg_rating"
        FROM series JOIN reviews ON series.id = reviews.series_id
        GROUP BY genre
        ORDER BY genre ASC;
        
        
-- 6. Print first name, last name, COUNT (num of reviews each reviewer has), MIN score, MAX score, AVG score, and STATUS (ACTIVE or INACTIVE).

        SELECT first_name, 
               last_name, 
               COUNT(rating) AS "COUNT", 
               IFNULL(MIN(rating), 0) AS "MIN", 
               IFNULL(MAX(rating), 0) AS "MAX", 
               IFNULL(ROUND(AVG(rating), 2),0) AS "AVG",
               CASE
                   WHEN COUNT(rating) IS NULL THEN "INACTIVE"
                   WHEN COUNT(rating) = 0 THEN "INACTIVE"
                   WHEN COUNT(rating) >= 10 THEN "CRAZY"
                   ELSE "ACTIVE"
               END AS "STATUS"
        FROM reviewers LEFT JOIN reviews ON reviewers.id = reviews.reviewer_id
        GROUP BY reviewers.id;
        
        -- Entire case statement can be replaced by:
                -- IF(COUNT(rating) >=1, "ACTIVE", "INACTIVE") AS STATUS
                -- This is useful when there are only TWO choices.
                
                
-- 7. Print every rating for every series. Show title, rating, and reviewer.
--    Join all 3 tables.

        SELECT title, 
               rating, 
               CONCAT(reviewers.first_name, " ", reviewers.last_name) AS "reviewer"
        FROM series 
            JOIN reviews 
                ON series.id = reviews.series_id
            JOIN reviewers 
                ON reviews.reviewer_id = reviewers.id
        ORDER BY series.id ASC;