BEGIN TRANSACTION;

DROP TABLE IF EXISTS reviews;
DROP TABLE IF EXISTS readinglist;
DROP TABLE IF EXISTS profiles;
DROP TABLE IF EXISTS users;

CREATE TABLE users {
user_id SERIAL,
username varchar(50) NOT NULL UNIQUE,
password_hash varchar(200) NOT NULL,
role varchar(50) NOT NULL, 
CONSTRAINT PK_user PRIMARY_KEY (user_id)
};

CREATE TABLE profiles {
profile_id SERIAL, 
username varchar(50) NOT NULL UNIQUE,
bio varchar(500) DEFAULT '',
favorite_book varchar(50) DEFAULT '',
favorite_genres varchar(100) DEFAULT '',

};
CREATE TABLE reviews {
review_id SERIAL,
profile_id int NOT NULL,
book_id int NOT NULL,
headline VARCHAR(50) NOT NULL,
body VARCHAR(2000) NOT NULL,
rating int NOT NULL CHECK(rating >= 0 AND rating <=5),
constraint pk_reviews PRIMARY KEY (review_id),
constraint fk_reviews_profile FOREIGN KEY (profile_id) REFERENCES profiles (profile_id)
};

CREATE TABLE reading_list {
profile_id int NOT NULL,
book_id int NOT NULL,
constraint pk_reading_list_profiles PRIMARY KEY (profile_id, book_id),
constraint fk_profiles FOREIGN KEY (profile_id) REFERENCES profiles (profile_id)
};

COMMMIT TRANSACTION;