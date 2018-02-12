CREATE TABLE 'admin' (
    'id' int NOT NULL AUTO_INCREMENT,
    'username' varchar(15) NOT NULL,
    'password' varchar(16) NOT NULL,
    PRIMARY KEY ('id'),
    UNIQUE KEY ('username')
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE 'car' (
    'id' int NOT NULL AUTO_INCREMENT,
    'image' varchar(200) NOT NULL,
    'available' tinyint(1) DEFAULT 1,
    'car_number' varchar(20) NOT NULL,
    'color' varchar(50) NOT NULL,
    'type' int NOT NULL,
    'fuel' varchar(20) NOT NULL,
    'few' int NOT NULL,
    'distance' int NOT NULL,
    'registration_date' timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    'area' enum('inland','jeju','overseas') NOT NULL DEFAULT inland,
    'ider_repair' tinyint(1) DEFAULT 0,
    'carprice_id' int NOT NULL,
    'name' varchar(30),
    PRIMARY KEY ('id'),
    UNIQUE KEY ('car_number')
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE 'car_price' (
    'id' int NOT NULL AUTO_INCREMENT,
    'six_hour' int NOT NULL,
    'ten_hour' int NOT NULL,
    'twelve' int NOT NULL,
    'two_days' int NOT NULL,
    'four_days' int NOT NULL,
    'six_days' int NOT NULL,
    'more' int NOT NULL,
    PRIMARY KEY ('id')
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE 'email_certification' (
    'id' int NOT NULL AUTO_INCREMENT,
    'email' varchar(50) NOT NULL,
    'number' int NOT NULL,
    PRIMARY KEY ('id')
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE 'feedback' (
    'id' int NOT NULL AUTO_INCREMENT,
    'name' varchar(20),
    'email' varchar(50) NOT NULL,
    'phone' varchar(25) NOT NULL,
    'divison' enum('차량','사이트'),
    'category' enum('칭찬','불만'),
    'title' text,
    'contents' text,
    'timestamp' timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY ('id')
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE 'feedback_comment' (
    'id' int NOT NULL AUTO_INCREMENT,
    'admin' tinyint(1) DEFAULT 1,
    'feedback_id' int NOT NULL,
    'contents' text NOT NULL,
    'timestamp' timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY ('id')
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE 'image' (
    'id' int NOT NULL AUTO_INCREMENT,
    'original_filename' varchar(200) NOT NULL,
    'changed_filename' varchar(300) NOT NULL,
    PRIMARY KEY ('id')
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE 'license' (
    'id' int NOT NULL AUTO_INCREMENT,
    'category' int NOT NULL,
    'type' int NOT NULL,
    'number' varchar(30) NOT NULL,
    'date_if_issue' timestamp DEFAULT CURRENT_TIMESTAMP,
    'aptitude_test' timestamp DEFAULT CURRENT_TIMESTAMP,
    'blacklist' tinyint(1) DEFAULT 0,
    'blacklist_date' timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY ('id'),
    UNIQUE KEY ('number')
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE 'notice' (
    'id' int NOT NULL AUTO_INCREMENT,
    'timestamp' timestamp DEFAULT CURRENT_TIMESTAMP,
    'title' text,
    'contents' text,
    PRIMARY KEY ('id')
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE 'reservation' (
    'id' int NOT NULL AUTO_INCREMENT,
    'number' int NOT NULL,
    'email' varchar(50),
    'car_number' varchar(20),
    'cost' int NOT NULL,
    'returned' tinyint(1) DEFAULT 0,
    'rental_date' timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    'return_date' timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    'rental_point' varchar(20) NOT NULL,
    'return_point' varchar(20) NOT NULL,
    'seat' tinyint(1) DEFAULT 0,
    'navigation_korean' tinyint(1) DEFAULT 1,
    'navigation_english' tinyint(1) DEFAULT 0,
    'damage_indemnity' tinyint(1) DEFAULT 0,
    PRIMARY KEY ('id'),
    UNIQUE KEY ('number')
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE 'users' (
    'id' int NOT NULL AUTO_INCREMENT,
    'email' varchar(50) NOT NULL,
    'name' varchar(20),
    'username' varchar(15) NOT NULL,
    'password' varchar(16) NOT NULL,
    'phone' varchar(25) NOT NULL,
    'timestamp' timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    'point' int DEFAULT 0,
    'failures' int DEFAULT 0,
    'license_id' int NOT NULL,
    PRIMARY KEY ('id'),
    UNIQUE KEY ('email'),
    UNIQUE KEY ('username'),
    UNIQUE KEY ('license_id')
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

