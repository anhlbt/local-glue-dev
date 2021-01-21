CREATE SCHEMA IF NOT EXISTS office;

CREATE TABLE IF NOT EXISTS office.employee (
  id      int,
  name    varchar(255),
  amount int
);
TRUNCATE TABLE office.employee;
INSERT INTO office.employee VALUES (1,  'psql Brandon Keller',    61);
INSERT INTO office.employee VALUES (2,  'psql Kathleen Knight',   93);
INSERT INTO office.employee VALUES (3,  'psql Timothy Bridges',   85);
INSERT INTO office.employee VALUES (4,  'psql Mark Powell',       23);
INSERT INTO office.employee VALUES (5,  'psql Nicole Burgess',    46);
INSERT INTO office.employee VALUES (6,  'psql Christina Harris',  80);
INSERT INTO office.employee VALUES (7,  'psql Robert Watson',     15);
INSERT INTO office.employee VALUES (8,  'psql Brenda Hawkins',    44);
INSERT INTO office.employee VALUES (9,  'psql Jessica Ramsey',    93);
INSERT INTO office.employee VALUES (10, 'psql Tiffany Stafford;', 74);
