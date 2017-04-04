CREATE TABLE IF NOT EXISTS DEPARTMENT (
	dept_id serial PRIMARY KEY,
	dept_description varchar(300),
	dept_name varchar(70),
	dept_location varchar(35)
);

CREATE TABLE IF NOT EXISTS PROJECT (
	proj_id serial PRIMARY KEY,
	proj_name varchar(20),
	proj_description varchar(300),
	proj_status varchar(20),
	expected_cost decimal(12,2),
	current_cost decimal(12,2),
	start_date timestamp,
	expected_date timestamp,
	end_date timestamp,
	expected_hours int,
	current_hours int,
	location varchar(35)
);

CREATE TABLE IF NOT EXISTS EMPLOYEE (
	uuid serial PRIMARY KEY,
	fname varchar(35),
	lname varchar(35),
	job_title varchar(70),
	email varchar(70),
	location varchar(35),
	fulltime boolean,
	pay decimal(12,2),
	start_date timestamp,
	end_date timestamp,
	supervisor_id serial
);

CREATE TABLE IF NOT EXISTS LOGIN (
	login_id serial PRIMARY KEY,
	login_username varchar(35),
	login_password varchar(60)
);

CREATE TABLE IF NOT EXISTS ROLE (
	role_id serial PRIMARY KEY,
	role_name varchar(70),
	role_description varchar(300)
);

CREATE TABLE IF NOT EXISTS TASK (
	task_id serial PRIMARY KEY,
	task_name varchar(35),
	task_description varchar(300),
	expected_hours int,
	current_hours int,
	task_resource_cost decimal(12,2)
);
