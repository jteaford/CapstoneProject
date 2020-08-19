-- CREATE DATABASE clevelandcarpentry;

USE clevelandcarpentry;
DROP TABLE IF EXISTS expenses;
DROP TABLE IF EXISTS ledger;
DROP TABLE IF EXISTS locations;
DROP TABLE IF EXISTS revenues;
DROP TABLE IF EXISTS projects;
DROP TABLE IF EXISTS clients;
drop table if exists referrals;
DROP TABLE IF EXISTS statuses;
DROP TABLE IF EXISTS expense_types;
DROP TABLE IF EXISTS expenses;
DROP TABLE IF EXISTS revenue_types;

CREATE TABLE statuses (
	status_id INT AUTO_INCREMENT PRIMARY KEY,
    project_status VARCHAR(50) NOT NULL
);

insert into statuses (project_status) values ('INQUIRED');
insert into statuses (project_status) values ('ESTIMATE WITH CLIENT');
insert into statuses (project_status) values ('IN PROGRESS');
insert into statuses (project_status) values ('COMPLETED');
insert into statuses (project_status) values ('DECLINED');



CREATE TABLE referrals (
referral_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
referral_type VARCHAR(50)
);

insert into referrals (referral_type) values ('Family');
insert into referrals (referral_type) values ('Friend');
insert into referrals (referral_type) values ('Coworker');
insert into referrals (referral_type) values ('Client Referral');
insert into referrals (referral_type) values ('Walk-by');
insert into referrals (referral_type) values ('Instagram');
insert into referrals (referral_type) values ('Facebook');
insert into referrals (referral_type) values ('Other');



CREATE TABLE clients (
client_id INT AUTO_INCREMENT PRIMARY KEY,
client_code VARCHAR(3) NOT NULL,
client_first_name VARCHAR(50) NOT NULL,
client_last_name VARCHAR(50) NOT NULL,
client_email_address VARCHAR(100),
client_phone_number VARCHAR(10),
referral_id INT,
FOREIGN KEY (referral_id) REFERENCES referrals (referral_id)
);

insert into clients (client_code, client_first_name, client_last_name, referral_id) values ('CC', 'Claire', 'Cleveland', 1);
insert into clients (client_code, client_first_name, client_last_name, referral_id) values ('ZF', 'Zach', 'Fallowfield', 2);
insert into clients (client_code, client_first_name, client_last_name, referral_id) values ('SK', 'Sam', 'Kemig', 2);
insert into clients (client_code, client_first_name, client_last_name, referral_id) values ('LT', 'Lauren', 'Teaford', 1);
insert into clients (client_code, client_first_name, client_last_name, referral_id) values ('DP', 'Doug', 'Pyzel', 7);
insert into clients (client_code, client_first_name, client_last_name, referral_id) values ('RT', 'Rachel', 'Teaford', 1);
insert into clients (client_code, client_first_name, client_last_name, referral_id) values ('SB', 'Steve', 'Barry', 2);
insert into clients (client_code, client_first_name, client_last_name, referral_id) values ('DN', 'Desi', 'Noel', 7);
insert into clients (client_code, client_first_name, client_last_name, referral_id) values ('KH', 'Kiefer', 'Hyland', 2);
insert into clients (client_code, client_first_name, client_last_name, referral_id) values ('KB', 'Kelly', 'Bast', 2);
insert into clients (client_code, client_first_name, client_last_name, referral_id) values ('WA', 'William', 'Arebalo', 5);
insert into clients (client_code, client_first_name, client_last_name, referral_id) values ('KT', 'Kim', 'Teaford', 1);
insert into clients (client_code, client_first_name, client_last_name, referral_id) values ('KJ', 'Kelsey', 'Johnson', 2);
insert into clients (client_code, client_first_name, client_last_name, referral_id) values ('LD', 'Lani', 'Dash', 7);
insert into clients (client_code, client_first_name, client_last_name, referral_id) values ('AM', 'Ashley', 'Michelle', 7);
insert into clients (client_code, client_first_name, client_last_name, referral_id) values ('AS', 'Amber', 'Schmit', 7);
insert into clients (client_code, client_first_name, client_last_name, referral_id) values ('MC', 'Maria', 'Clark', 2);

select * from clients;

create table projects (
project_id INT AUTO_INCREMENT PRIMARY KEY,
project_code VARCHAR(20) NOT NULL,
project_desc VARCHAR(100),
status_id INT,
client_id INT,
FOREIGN KEY (client_id) REFERENCES clients (client_id),
client_project_number INT
);


insert into projects (project_code, project_desc, status_id, client_id, client_project_number) values ('KH-01', '(2) Adirondack Chairs', 3, 9, 1);
insert into projects (project_code, project_desc, status_id, client_id, client_project_number) values ('KB-01', 'Outdoor Bench', 1, 10, 1);
insert into projects (project_code, project_desc, status_id, client_id, client_project_number) values ('CC-01', 'Amish Coffee Table', 4, 1, 1);
insert into projects (project_code, project_desc, status_id, client_id, client_project_number) values ('CC-02', 'Modern Desk', 4, 1, 2);
insert into projects (project_code, project_desc, status_id, client_id, client_project_number) values ('SB-01', 'Concealed Rifle Flag Cabinet', 4, 7, 2);
insert into projects (project_code, project_desc, status_id, client_id, client_project_number) values ('ZF-01', '(2) Twin Nightstands', 4, 2, '01');
insert into projects (project_code, project_desc, status_id, client_id, client_project_number) values ('ZF-02', 'Concealed Rifle Flag Cabinet', 4, 2, 2);
insert into projects (project_code, project_desc, status_id, client_id, client_project_number) values ('RT-01', 'Herringbone Coffee Table', 4, 6, 2);
insert into projects (project_code, project_desc, status_id, client_id, client_project_number) values ('LT-01', 'Shiplap Coffee Table', 4, 4, 1);
insert into projects (project_code, project_desc, status_id, client_id, client_project_number) values ('SK-01', 'Herringbone Bench', 4, 3, 1);
insert into projects (project_code, project_desc, status_id, client_id, client_project_number) values ('KT-01', 'Outdoor Fence', 1, 12, 1);
insert into projects (project_code, project_desc, status_id, client_id, client_project_number) values ('KT-02', 'Laundry Cabinet Doors', 1, 12, 1);
insert into projects (project_code, project_desc, status_id, client_id, client_project_number) values ('KJ-01', 'Laundry Cabinets', 2, 13, 1);
insert into projects (project_code, project_desc, status_id, client_id, client_project_number) values ('DN-01', 'American Flag', 2, 8, 1);
insert into projects (project_code, project_desc, status_id, client_id, client_project_number) values ('DP-01', 'Guitar Display Wall', 5, 5, 1);
insert into projects (project_code, project_desc, status_id, client_id, client_project_number) values ('AM-01', 'Porch Swing', 5, 15, 1);
insert into projects (project_code, project_desc, status_id, client_id, client_project_number) values ('LD-01', 'Bathroom Linen Cabinet', 2, 14, 1);
insert into projects (project_code, project_desc, status_id, client_id, client_project_number) values ('MC-01', '(2) Twin Nightstands', 5, 17, 1);



create table ledger (
transaction_id INT AUTO_INCREMENT PRIMARY KEY,
date_of_transaction DATE,
transaction_description VARCHAR(250) NOT NULL,
location_id INT,
transaction_amount INT NOT NULL,
project_id INT,
FOREIGN KEY (project_id) REFERENCES projects (project_id)
);

UPDATE clients
SET client_email_address = 'teaford.lauren@yahoo.com', client_phone_number = '4029601835'
WHERE client_id = 4;

UPDATE clients
SET client_email_address = 'rachel.teaford@yahoo.com', client_phone_number = '4029536993'
WHERE client_id = 6;



create table expense_types (
expense_id INT AUTO_INCREMENT PRIMARY KEY,
expense_type VARCHAR(50)
);

insert into expense_types (expense_type) values ('Wood');
insert into expense_types (expense_type) values ('Tool');
insert into expense_types (expense_type) values ('Hardware');


create table revenue_types (
revenue_id INT AUTO_INCREMENT PRIMARY KEY,
revenue_type VARCHAR(50)
);

insert into revenue_types (revenue_type) values ('Deposit');
insert into revenue_types (revenue_type) values ('Final Payment');
insert into revenue_types (revenue_type) values ('Tax Return');


create table locations (
location_id INT AUTO_INCREMENT PRIMARY KEY,
location_name VARCHAR(50),
address_desc VARCHAR(50),
location_milage INT,
location_address VARCHAR(50)
);

insert into locations (location_name, address_desc, location_milage, location_address) values ('Lowe''s', '183rd & Center', 3.8, '18375 Wright St, Omaha, NE 68130');
insert into locations (location_name, address_desc, location_milage, location_address) values ('Lowe''s', '75th & Dodge', 14.2, '7525 Dodge St, Omaha, NE 68114');
insert into locations (location_name, location_milage, location_address) values ('Liberty Hardwoods', 17.1, '1920 S 19th St, Omaha, NE 68108');
insert into locations (location_name, address_desc, location_milage, location_address) values ('Home Depot', 'L Street', 5.8, '12710 L St, Omaha, NE 68137');

create table revenues (
transaction_id INT AUTO_INCREMENT PRIMARY KEY,
date_of_transaction DATE,
transaction_description VARCHAR(250) NOT NULL,
location_id INT,
FOREIGN KEY (location_id) REFERENCES locations (location_id),
revenue_id INT,
FOREIGN KEY (revenue_id) REFERENCES revenue_types (revenue_id),
transaction_amount INT NOT NULL,
project_id INT,
FOREIGN KEY (project_id) REFERENCES projects (project_id)
);

insert into revenues (date_of_transaction, transaction_description, revenue_id, transaction_amount, project_id) values ('2020-08-17', 'Payment for Chairs', 2, 415.00, 1);

create table expenses (
transaction_id INT AUTO_INCREMENT PRIMARY KEY,
date_of_transaction DATE,
transaction_description VARCHAR(250) NOT NULL,
location_id INT,
FOREIGN KEY (location_id) REFERENCES locations (location_id),
transaction_amount DECIMAL(16,2) NOT NULL,
expense_id INT,
FOREIGN KEY (expense_id) REFERENCES expense_types (expense_id),
project_id INT,
FOREIGN KEY (project_id) REFERENCES projects (project_id)
);

insert into expenses (date_of_transaction, transaction_description, transaction_amount) values ('2020-08-18', 'Table Saw', 1200.00);
