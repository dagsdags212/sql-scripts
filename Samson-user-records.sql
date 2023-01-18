CREATE DATABASE hackerhero_practice;
CREATE TABLE Users (
    id int NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email VARCHAR(255),
    encrypted_password VARCHAR(255),
    created_at DATETIME ,
    updated_at DATETIME,
    PRIMARY KEY (id)
);
USE hackerhero_practice;
INSERT INTO Users (first_name, last_name, email, encrypted_password, created_at, updated_at) VALUES ('Lebron', 'James', 'lebron_games@nba.com', 'ljames23', '2023-01-18', '2023-01-18');
INSERT INTO Users (first_name, last_name, email, encrypted_password, created_at, updated_at) VALUES ('Luka', 'Doncic', 'luka_doncic@nba.com', 'ldoncic77', '2023-01-18', '2023-01-18');
INSERT INTO Users (first_name, last_name, email, encrypted_password) VALUES ('Paul', 'George', 'paul_george@nba.com', 'pgeorge13');
UPDATE Users SET first_name = 'James', last_name = 'Harden', email = 'james_harden@nba.com', encrypted_password = 'jharden13' WHERE id = 1;
UPDATE Users SET last_name = 'Choi';
UPDATE Users SET updated_at = NOW() WHERE id IN (3,5,7,12,19);
DELETE FROM Users WHERE id = 1;
DELETE FROM Users;
DROP TABLE Users; -- this query drops a single table while deleting all records would mean dropping the entire database
ALTER TABLE Users RENAME COLUMN email TO email_address;
ALTER TABLE Users MODIFY COLUMN id BIGINT;
ALTER TABLE Users ADD is_active BOOLEAN NOT NULL;
ALTER TABLE Users ALTER is_active SET DEFAULT 0;