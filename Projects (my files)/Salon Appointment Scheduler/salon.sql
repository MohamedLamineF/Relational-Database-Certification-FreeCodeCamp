-- psql --username=freecodecamp --dbname=postgres
create database salon;

-- \c salon
create table
  customers (
    customer_id SERIAL PRIMARY KEY,
    phone varchar(15) unique,
    name varchar(40)
  );

create table
  services (service_id SERIAL PRIMARY KEY, name varchar(40));

create table
  appointments (
    appointment_id SERIAL PRIMARY KEY,
    time varchar(10),
    customer_id int not null,
    service_id int not null,
    CONSTRAINT fk_appt_cstm FOREIGN KEY (customer_id) REFERENCES customers (customer_id),
    CONSTRAINT fk_appt_srv FOREIGN KEY (service_id) REFERENCES services (service_id)
  );

insert into
  services (name)
values
  ('cut'),
  ('color'),
  ('perm'),
  ('style'),
  ('trim');