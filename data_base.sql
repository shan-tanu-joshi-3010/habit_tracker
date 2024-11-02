CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE Habits (
    habit_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    habit_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),  -- Customizable categories
    frequency VARCHAR(20),  -- e.g., daily, weekly, monthly
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
);
CREATE TABLE Habit_Progress (
    progress_id INT PRIMARY KEY AUTO_INCREMENT,
    habit_id INT,
    date_completed DATE,
    status BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (habit_id) REFERENCES Habits(habit_id) ON DELETE CASCADE
);
CREATE TABLE Notifications (
    notification_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    habit_id INT,
    message VARCHAR(255),
    scheduled_time TIMESTAMP,
    sent BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (habit_id) REFERENCES Habits(habit_id) ON DELETE CASCADE
);
