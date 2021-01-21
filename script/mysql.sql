CREATE DATABASE IF NOT EXISTS office;

CREATE TABLE IF NOT EXISTS office.employee (
  id      int,
  name    varchar(20),
  amount int
);
TRUNCATE TABLE office.employee;
INSERT INTO office.employee VALUES (1,  'Brandon Keller',    61);
INSERT INTO office.employee VALUES (2,  'Kathleen Knight',   93);
INSERT INTO office.employee VALUES (3,  'Timothy Bridges',   85);
INSERT INTO office.employee VALUES (4,  'Mark Powell',       23);
INSERT INTO office.employee VALUES (5,  'Nicole Burgess',    46);
INSERT INTO office.employee VALUES (6,  'Christina Harris',  80);
INSERT INTO office.employee VALUES (7,  'Robert Watson',     15);
INSERT INTO office.employee VALUES (8,  'Brenda Hawkins',    44);
INSERT INTO office.employee VALUES (9,  'Jessica Ramsey',    93);
INSERT INTO office.employee VALUES (10, 'Tiffany Stafford;', 74);
