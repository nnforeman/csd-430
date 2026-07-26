-- Natasha Foreman
-- July 12th, 2026
-- CSD430 Module 5
-- Create Database, User, and Table

CREATE DATABASE IF NOT EXISTS CSD430;

CREATE USER IF NOT EXISTS 'student1'@'localhost'
IDENTIFIED BY 'pass';

GRANT ALL PRIVILEGES ON CSD430.* TO 'student1'@'localhost';

FLUSH PRIVILEGES;

USE CSD430;

DROP TABLE IF EXISTS natashastatesdata;

CREATE TABLE natashastatesdata (
    state_id INT AUTO_INCREMENT PRIMARY KEY,
    state_name VARCHAR(50) NOT NULL,
    city_location VARCHAR(100),
    travel_category VARCHAR(50),
    visit_type VARCHAR(50),
    reason_enjoyed VARCHAR(255)
);