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
CREATE TABLE IF NOT EXISTS new_senseis (
    name varchar(200) NOT NULL UNIQUE,
    role ENUM('sensei', 'front-desk', 'admin'),
    FOREIGN KEY(name) REFERENCES users(name),
    FOREIGN KEY(role) REFERENCES users(role));
CREATE TABLE IF NOT EXISTS posts
        (id INT UNSIGNED NOT NULL AUTO_INCREMENT,
        id_user binary(16) NOT NULL,
        topic varchar(100) NOT NULL,
        body TEXT NOT NULL,
        time_stamp DATETIME DEFAULT CURRENT_TIMESTAMP,
        up_votes INT DEFAULT 0,
        PRIMARY KEY (id),
        FOREIGN KEY (id_user) REFERENCES users(id_bin));
INSERT IGNORE INTO users (id_bin, name, password) VALUES (UNHEX(REPLACE(UUID(),'-','')), 'SUPERUSER', 'ADMINPASSWORD');
CREATE USER 'postit-user'@'localhost' IDENTIFIED BY 'postIT-super-secret-password';
GRANT SELECT, INSERT ON postit.* TO 'postit-user'@'localhost';
FLUSH PRIVILEGES;