--POPULATE EMPLOYEE

INSERT INTO PUBLIC.EMPLOYEE(f_name, m_initial, l_name, job_title, email, wage, is_supervisor)
VALUES('random', '1', 'joe', 'ceo',  'randomCeo@company.com', '12.64', true);

INSERT INTO PUBLIC.EMPLOYEE(f_name, m_initial, l_name, job_title, email, wage, is_supervisor)
VALUES('Billy', '2', 'Kid', 'ceo',  'bkid@company.com', '12.64', true);

INSERT INTO PUBLIC.EMPLOYEE(f_name, m_initial, l_name, job_title, email, wage, is_supervisor)
VALUES('Jason', '1', 'Jones', 'ceo',  'jjones@company.com', '12.64', true);

INSERT INTO PUBLIC.EMPLOYEE(f_name, m_initial, l_name, job_title, email, wage, is_supervisor)
VALUES('Mike', '1', 'Jones', 'ceo',  'mjones@company.com', '12.64', true);

INSERT INTO PUBLIC.EMPLOYEE(f_name, m_initial, l_name, job_title, email, wage, is_supervisor)
VALUES('John', '1', 'Smith', 'ceo',  'jsmith@company.com', '12.64', true);

--POPULATE DEPARTMENT
INSERT INTO PUBLIC.DEPARTMENT(name, description, location, dept_head_uuid)
VALUES('Marketing', 'Controls awareness and advertisements', 'Houston, TX', 1);

INSERT INTO PUBLIC.DEPARTMENT(name, description, location, dept_head_uuid)
VALUES('Administration', 'Oversees all other departments', 'Houston, TX', 2);

INSERT INTO PUBLIC.DEPARTMENT(name, description, location, dept_head_uuid)
VALUES('Auditing', 'Reviews and ', 'Houston, TX', 3);

INSERT INTO PUBLIC.DEPARTMENT(name, description, location, dept_head_uuid)
VALUES('Maintenance', 'In charge of cleaning and maintenance', 'New York City, NY', 4);

INSERT INTO PUBLIC.DEPARTMENT(name, description, location, dept_head_uuid)
VALUES('Research and Developement', 'Research and development new technologies for the project and company', 'Palo Alto, CA', 5);

--POPULATE PROJECTS
INSERT INTO PUBLIC.PROJECT (name, dept_number, proj_lead, description, status, budgeted_cost, current_cost)
VALUES ('Database Project', 5, 5, 'Build a project management website as well as backend', 'IN PROGRESS', 100, 0);

INSERT INTO PUBLIC.PROJECT (name, dept_number, proj_lead, description, status, budgeted_cost, current_cost)
VALUES ('Save the Cats', 1, 1, 'Rescue event that helps save kittens and cats from shitty projects', 'CANCELLED', 100, 0);

INSERT INTO PUBLIC.PROJECT (name, dept_number, proj_lead, description, status, budgeted_cost, current_cost)
VALUES ('Project:0', 2, 3, 'We go to the moon', 'COMPLETED', 100, 0);

INSERT INTO PUBLIC.PROJECT (name, dept_number, proj_lead, description, status, budgeted_cost, current_cost)
VALUES ('To Clean or Not To Clean', 4, 1, 'Clean everything, maintain everything', 'NOT STARTED', 100, 0);

--POPULATE LOGINS
