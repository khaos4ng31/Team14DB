--TEAM 14: PROJECT MANAGEMENT

--uncomment to create a fresh schema
-- DROP SCHEMA IF EXISTS PUBLIC CASCADE; --return schema to a clean default state
-- CREATE SCHEMA PUBLIC
-- 	AUTHORIZATION postgres; --NOTE: kkpuzfit is the name of the DB that the free DB hosting gave me, default would be postgres on a local server
-- GRANT ALL ON SCHEMA PUBLIC TO postgres; --restore all grants
-- GRANT ALL ON SCHEMA PUBLIC TO PUBLIC;
-- COMMENT ON SCHEMA PUBLIC
-- 	IS 'Team 14 Project Management Schema';


--create enum type for status, ordered in importance L->G
CREATE TYPE status_type AS ENUM (
	'CANCELLED',
	'NOT STARTED', 
	'IN PROGRESS', 
	'COMPLETED'
);

----------CREATE TABLES----------
CREATE TABLE IF NOT EXISTS PUBLIC.EMPLOYEE (
	uuid serial PRIMARY KEY,
	f_name varchar(35) NOT NULL,
	m_initial char(1),
	l_name varchar(35) NOT NULL,
	job_title varchar(70) NOT NULL,
	email varchar(254),
	phone_number varchar(12),
	address varchar(300),
	wage decimal(12,2) NOT NULL,
	start_date date,
	end_date date,
	is_supervisor boolean,
	supervisor_uuid int REFERENCES PUBLIC.EMPLOYEE(uuid), --foreign key to reference employee id
	CONSTRAINT valid_number CHECK (phone_number ~ '^[0-9]+$'),
	CONSTRAINT vald_work_date CHECK (end_date <= start_date),
	CONSTRAINT valid_wage CHECK (wage > 0) --can change this to min wage?
);


CREATE TABLE IF NOT EXISTS PUBLIC.DEPARTMENT (
	id serial PRIMARY KEY,
	name varchar(70) NOT NULL,
	description varchar(300),
	location varchar(70),
	dept_head_uuid int REFERENCES PUBLIC.EMPLOYEE(uuid) --foreign key to reference employee id
);

--create foreign key in employee that references department id
ALTER TABLE PUBLIC.EMPLOYEE ADD COLUMN dept_number int REFERENCES PUBLIC.DEPARTMENT(id);

CREATE TABLE IF NOT EXISTS PUBLIC.PROJECT (
	id serial PRIMARY KEY,
	name varchar(35) NOT NULL,
	dept_number int REFERENCES PUBLIC.DEPARTMENT(id), --create FK in proj to reference the dept that proj is under
	proj_lead int REFERENCES PUBLIC.EMPLOYEE(uuid), 	--create FK to reference the employee that is leading the proj
	description varchar(300),
	status status_type NOT NULL,
	budgeted_cost decimal(12,2) NOT NULL,
	current_cost decimal(12,2) NOT NULL,
	expected_finish_date date,	--expected finish date
	start_date date,
	end_date date,			--end date can be when it is cancelled or finished
	CONSTRAINT valid_costs CHECK (budgeted_cost >= 0 AND current_cost >= 0),
	CONSTRAINT valid_end_date CHECK (end_date >= start_date)
);

CREATE TABLE IF NOT EXISTS PUBLIC.LOGIN (
	employee_id int REFERENCES PUBLIC.EMPLOYEE(uuid), --create FK to link employee to a login
	username varchar(35) NOT NULL,
	password char(60) NOT NULL --hashed with salt using bcrypt will always yield a 60 char string, no variation
);

CREATE TABLE IF NOT EXISTS PUBLIC.WORKS_ON(
	id serial PRIMARY KEY,
	employee_id serial REFERENCES PUBLIC.EMPLOYEE(uuid),
	proj_id serial REFERENCES PUBLIC.PROJECT(id), 
	hours_worked int,
	CONSTRAINT valid_hours CHECK (hours_worked >= 0)
);

CREATE TABLE IF NOT EXISTS PUBLIC.WORKS_IN(
	employee_id serial REFERENCES PUBLIC.EMPLOYEE(uuid),
	dept_no serial REFERENCES PUBLIC.DEPARTMENT(id)
);

--VIEWS
CREATE OR REPLACE VIEW PUBLIC.PROJECT_LEADS_V AS (
SELECT 
	p.name AS project_name,
	e.f_name::text || ' ' ||e.l_name::text AS project_leader
	--this combines first name with last name, while adding a space between
FROM EMPLOYEE e, PROJECT p
WHERE e.uuid = p.proj_lead
);