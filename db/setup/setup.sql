CREATE DATABASE IF NOT EXISTS cnSkManagement;
USE cnSkManagement;
CREATE TABLE IF NOT EXISTS users
        (id_bin binary(16),
        id_text varchar(36) generated always as (
        insert(
            insert(
                insert(
                    insert(hex(id_bin),9,0,'-'),
                    14,0,'-'),
                19,0,'-'),
            24,0,'-')
        ) virtual,
        name varchar(200) NOT NULL UNIQUE,
        password varchar(200) NOT NULL,
        role ENUM('sensei', 'front-desk', 'admin'),
        PRIMARY KEY (id_bin));
CREATE TABLE IF NOT EXISTS posts
        (id INT UNSIGNED NOT NULL AUTO_INCREMENT,
        id_user binary(16) NOT NULL,
        topic varchar(100) NOT NULL,
        body TEXT NOT NULL,
        time_stamp DATETIME DEFAULT CURRENT_TIMESTAMP,
        up_votes INT DEFAULT 0,
        PRIMARY KEY (id),
        FOREIGN KEY (id_user) REFERENCES users(id_bin));
CREATE TABLE IF NOT EXISTS comments (
        id INT UNSIGNED NOT NULL AUTO_INCREMENT,
        id_user binary(16) NOT NULL,
        id_post INT UNSIGNED NOT NULL,
        id_host INT UNSIGNED,
        body TEXT NOT NULL,
        time_stamp DATETIME DEFAULT CURRENT_TIMESTAMP,
        PRIMARY KEY (id),
        FOREIGN KEY (id_user) REFERENCES users(id_bin),
        FOREIGN KEY (id_post) REFERENCES posts(id),
        FOREIGN KEY (id_host) REFERENCES comments(id));
INSERT IGNORE INTO users (id_bin, name, password) VALUES (UNHEX(REPLACE(UUID(),'-','')), 'SUPERUSER', 'ADMINPASSWORD');
CREATE USER 'postit-user'@'localhost' IDENTIFIED BY 'postIT-super-secret-password';
GRANT SELECT, INSERT ON postit.* TO 'postit-user'@'localhost';
FLUSH PRIVILEGES;