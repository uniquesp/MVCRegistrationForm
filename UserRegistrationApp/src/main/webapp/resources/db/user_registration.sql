--DATABASENAME: user_registration

CREATE TABLE user(
	id int(10) PRIMARY KEY NOT NULL,
	email varchar(150) NOT NULL,
	mobile_no varchar(10) NOT NULL,
	bdate date NOT NULL,
	country varchar(150) NOT NULL,
	state varchar(150) NOT NULL,
	district varchar(150) NOT NULL,
	city varchar(150) NOT NULL,
	area varchar(150) NOT NULL,
	pincode int(10) NOT NULL,
	gender varchar(30) NOT NULL,
	hobbies varchar(255) NOT NULL,
	language varchar(255) NOT NULL,
	profile_pic BLOB,
	password varchar(255) NOT NULL,
	registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
