-- CREATE DATABASE insta_db;
-- USE insta_db;


CREATE TABLE users(
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);


CREATE TABLE photos(
    id INT AUTO_INCREMENT PRIMARY KEY,
    image_url VARCHAR(255) NOT NULL,
    user_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id)
);


CREATE TABLE comments(
    id INT AUTO_INCREMENT PRIMARY KEY,
    comment_text VARCHAR(255) NOT NULL,
    user_id INT NOT NULL,
    photo_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(photo_id) REFERENCES photos(id)
    
);


CREATE TABLE likes (
    user_id INTEGER NOT NULL,
    photo_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    PRIMARY KEY(user_id, photo_id)
); 


CREATE TABLE follows(
    follower_id INT NOT NULL,
    followee_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(follower_id) REFERENCES users(id),
    FOREIGN KEY(followee_id) REFERENCES users(id),
    PRIMARY KEY(follower_id, followee_id)
);


CREATE TABLE tags (
  id INTEGER AUTO_INCREMENT PRIMARY KEY,
  tag_name VARCHAR(255) UNIQUE,
  created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE photo_tags (
    photo_id INTEGER NOT NULL,
    tag_id INTEGER NOT NULL,
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    FOREIGN KEY(tag_id) REFERENCES tags(id),
    PRIMARY KEY(photo_id, tag_id)
);


--- CHALLENGE QUERIES ---

-- 1. Print the 5 oldest users.

        SELECT * 
        FROM users 
        ORDER BY created_at ASC LIMIT 5;
        
        
-- 2. What day of the week do most users register on?

        SELECT DAYNAME(created_at) AS "Day", 
               COUNT(created_at) AS "DayCount" 
        FROM users 
        GROUP BY Day 
        ORDER BY DayCount DESC;
        
        
-- 3. Find the users who have NEVER posted a photo.

        SELECT username, 
               IFNULL(image_url, "NONE") AS "No Photos"
        FROM users LEFT JOIN photos ON users.id = photos.user_id
        WHERE image_url IS NULL;
        
        
-- 4. Find the user who has the most likes on a single photo.
        SELECT username, 
               likes.photo_id AS "Photo ID", 
               photos.image_url AS "Photo URL", 
               COUNT(likes.photo_id) AS "NumberOfLikes"
        FROM users 
            JOIN photos ON users.id = photos.user_id
            JOIN likes ON likes.photo_id = photos.id
        GROUP BY likes.photo_id
        ORDER BY NumberOfLikes DESC LIMIT 5;
        
        
-- 5. How many times does the average user post? Take total number of photos and divide by users.
-- Total photos / total users
        SELECT ROUND(
                    (SELECT COUNT(*) FROM photos) / (SELECT COUNT(*) FROM users)
                    , 2) AS "Average Photos Per User"; 
                    
                    
-- 6. What are the 5 most commonly used hashtags?

        SELECT tags.tag_name AS "TAGS", 
               COUNT(*) AS "TOTAL"
        FROM photo_tags 
            LEFT JOIN tags ON tags.id = photo_tags.tag_id
        GROUP BY tags.id
        ORDER BY TOTAL DESC LIMIT 5;
        
        
-- 7. Find users who have liked every single photo on the site.

        SELECT likes.user_id AS "USER ID", 
               username AS "USERNAME", 
               COUNT(*) AS "TOTAL_LIKES" 
        FROM likes 
            JOIN users ON likes.user_id = users.id 
        GROUP BY users.id 
        ORDER BY TOTAL_LIKES DESC;
        
        -- OR
        
        SELECT likes.user_id AS "USER ID", 
               username AS "USERNAME", 
               COUNT(*) AS "TOTAL_LIKES" 
        FROM likes 
            JOIN users ON likes.user_id = users.id 
        GROUP BY users.id
        HAVING TOTAL_LIKES = (SELECT COUNT(*) FROM photos);