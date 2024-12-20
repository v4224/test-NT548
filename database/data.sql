CREATE DATABASE IF NOT EXISTS Login_user;

USE Login_user;

CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO users (username, password) VALUES 
('user1', 'password1'),
('user2', 'password2'),
('admin', 'adminpassword');