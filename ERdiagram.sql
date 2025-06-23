CREATE TABLE `Author` (
  `author_id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `bio` text
);

CREATE TABLE `Category` (
  `category_id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255)
);

CREATE TABLE `Book` (
  `book_id` int PRIMARY KEY AUTO_INCREMENT,
  `title` varchar(255),
  `publication_year` int,
  `category_id` int
);

CREATE TABLE `BookAuthor` (
  `book_id` int,
  `author_id` int,
  PRIMARY KEY (`book_id`, `author_id`)
);

CREATE TABLE `Member` (
  `member_id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `email` varchar(255),
  `join_date` date
);

CREATE TABLE `Loan` (
  `loan_id` int PRIMARY KEY AUTO_INCREMENT,
  `book_id` int,
  `member_id` int,
  `loan_date` date,
  `return_date` date
);

ALTER TABLE `Book` ADD FOREIGN KEY (`category_id`) REFERENCES `Category` (`category_id`);

ALTER TABLE `BookAuthor` ADD FOREIGN KEY (`book_id`) REFERENCES `Book` (`book_id`);

ALTER TABLE `BookAuthor` ADD FOREIGN KEY (`author_id`) REFERENCES `Author` (`author_id`);

ALTER TABLE `Loan` ADD FOREIGN KEY (`book_id`) REFERENCES `Book` (`book_id`);

ALTER TABLE `Loan` ADD FOREIGN KEY (`member_id`) REFERENCES `Member` (`member_id`);
