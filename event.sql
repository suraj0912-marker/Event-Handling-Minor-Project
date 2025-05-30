CREATE DATABASE IF NOT EXISTS event;
USE event;

CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    branch VARCHAR(50),
    year VARCHAR(20),
    semester VARCHAR(20),
    mobile VARCHAR(15),
    role VARCHAR(20) DEFAULT 'student',
    question VARCHAR(255),
    answer VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS events (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price INT DEFAULT 0
);

CREATE TABLE IF NOT EXISTS participation (
    id INT AUTO_INCREMENT PRIMARY KEY,
    student_email VARCHAR(100),
    event_id INT,
    event_name VARCHAR(100),
    FOREIGN KEY (student_email) REFERENCES users(email) ON DELETE CASCADE,
    FOREIGN KEY (event_id) REFERENCES events(id) ON DELETE CASCADE
);

INSERT INTO users (name, email, password, role)
VALUES ('Admin', 'admin@event.com', '$2a$12$examplehashforadminpass', 'admin')
ON DUPLICATE KEY UPDATE email = email;

INSERT INTO events (name, description, price) VALUES
('Quiz Competition', 'Test your knowledge across multiple topics', 50),
('Coding Contest', 'Compete in real-time coding challenges', 100),
('Treasure Hunt', 'Solve clues and find the prize', 60),
('Debate Competition', 'Debate on trending topics', 40),
('Art Exhibition', 'Showcase your creativity through art', 30),
('Photography Contest', 'Capture the best moment and win', 70),
('Gaming Tournament', 'Play and win gaming competitions', 80),
('Technical Workshop', 'Attend hands-on tech learning session', 90);
