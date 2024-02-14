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
    PRIMARY KEY (name));
CREATE TABLE IF NOT EXISTS ninjas
        (name varchar(100),
        belt enum('white', 'yellow', 'orange', 'green', 'blue', 'purple', 'brown', 'red', 'black'),
        current_activity varchar(10));
INSERT INTO users (id_bin, name, password, role) VALUES (UNHEX(REPLACE(UUID(),'-','')), 'SUPERUSER', 'ADMINPASSWORD', 'admin')
ON DUPLICATE KEY UPDATE id_bin=UNHEX(REPLACE(UUID(),'-',''));
# CREATE USER 'postit-user'@'localhost' IDENTIFIED BY 'postIT-super-secret-password';
# GRANT SELECT, INSERT ON postit.* TO 'postit-user'@'localhost';
# FLUSH PRIVILEGES;