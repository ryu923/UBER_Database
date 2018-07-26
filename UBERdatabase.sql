/* UBER Database Code */

/* Drop All Table */
DROP TABLE uber_trips CASCADE CONSTRAINTS;
DROP TABLE uber_customers CASCADE CONSTRAINTS;
DROP TABLE uber_locations CASCADE CONSTRAINTS;
DROP TABLE uber_drivers CASCADE CONSTRAINTS;
DROP TABLE uber_paymentmethods CASCADE CONSTRAINTS;
DROP TABLE uber_cars CASCADE CONSTRAINTS;

/* Create an "uber_locations" table */
CREATE TABLE uber_locations
(   locationID CHAR(10),
    address    VARCHAR2(50),
    city       VARCHAR2(20),
    country    VARCHAR2(20),
    postalcode CHAR(6),
CONSTRAINT uber_locations_locationid_pk primary key (locationID));

SELECT * FROM uber_locations;
DESC uber_locations;

/* Input data into "uber_locations" table */
INSERT INTO uber_locations (locationID, address, city, country, postalcode)
    VALUES ('UL7123', '82 Eglington East', 'Toronto', 'CA', 'M4R1B2');

INSERT INTO uber_locations (locationID, address, city, country, postalcode)
    VALUES ('UL9438', '5 York Mill West', 'Toronto', 'CA', 'M3R7C1');

INSERT INTO uber_locations (locationID, address, city, country, postalcode)
    VALUES ('UL0376', '82 Queens Street', 'Etobicoke', 'CA', 'M1S1D6');
    
INSERT INTO uber_locations (locationID, address, city, country, postalcode)
    VALUES ('UL9381', '912 Rathburn Rd West', 'Mississauga', 'CA', 'L5B0E2');

INSERT INTO uber_locations (locationID, address, city, country, postalcode)
    VALUES ('UL2956', '1800 Sheppard Ave East', 'Toronto', 'CA', 'M2J5A7');

INSERT INTO uber_locations (locationID, address, city, country, postalcode)
    VALUES ('UL0282', '100 Cowdray Ct', 'Scarborough', 'CA', 'M1S5C8');

INSERT INTO uber_locations (locationID, address, city, country, postalcode)
    VALUES ('UL2382', '3255 Highway 7 East', 'Markham', 'CA', 'L3R3P9');

INSERT INTO uber_locations (locationID, address, city, country, postalcode)
    VALUES ('UL7012', '10675 Yonge St', 'Richmond Hill', 'CA', 'L4C3E1');
    
INSERT INTO uber_locations (locationID, address, city, country, postalcode)
    VALUES ('UL2049', '88 Auto Vaughan Dr', 'Vaughan', 'CA', 'L6A4A1');

INSERT INTO uber_locations (locationID, address, city, country, postalcode)
    VALUES ('UL8371', '941 Progress Ave', 'Toronto', 'CA', 'M1K5E9');

/* Create an "uber_customers" table */
CREATE TABLE uber_customers
(   customerID      CHAR(8),
    customerLast    VARCHAR2(20),
    customerFirst   VARCHAR2(20),
    customerPhone   CHAR(10),
    customerRate    number(3,2),
    homeID          CHAR(10),
CONSTRAINT uber_customers_customerid_pk primary key (customerID),
CONSTRAINT uber_customers_homeid_fk foreign key (homeID) REFERENCES uber_locations (locationID));

SELECT * FROM uber_customers;
DESC uber_customers;

/* Input data into "uber_customers" table */
INSERT INTO uber_customers (customerID, customerLast, customerFirst, customerPhone, customerRate, homeID)
    VALUES ('UC9372', 'Noah', 'Liam', '6478930198', 4.52, 'UL7123');

INSERT INTO uber_customers (customerID, customerLast, customerFirst, customerPhone, customerRate, homeID)
    VALUES ('UC0284', 'Mason', 'Jacob', '6479370382', 4.82, 'UL9438');

INSERT INTO uber_customers (customerID, customerLast, customerFirst, customerPhone, customerRate, homeID)
    VALUES ('UC2381', 'William', 'Ethan', '6479387272', 4.92, 'UL0376');

INSERT INTO uber_customers (customerID, customerLast, customerFirst, customerPhone, customerRate, homeID)
    VALUES ('UC7462', 'James', 'Alexander', '6470237372', 3.72, 'UL9381');

INSERT INTO uber_customers (customerID, customerLast, customerFirst, customerPhone, customerRate, homeID)
    VALUES ('UC0382', 'Michael', 'Benjamin', '6478462918', 4.24, 'UL2956');

INSERT INTO uber_customers (customerID, customerLast, customerFirst, customerPhone, customerRate, homeID)
    VALUES ('UC5632', 'Elijah', 'Daniel', '6479472563', 3.96, 'UL0282');

INSERT INTO uber_customers (customerID, customerLast, customerFirst, customerPhone, customerRate, homeID)
    VALUES ('UC4392', 'Aiden', 'Logan', '6472538457', 4.17, 'UL2382');

INSERT INTO uber_customers (customerID, customerLast, customerFirst, customerPhone, customerRate, homeID)
    VALUES ('UC6802', 'Matthew', 'Lucas', '6479382637', 3.25, 'UL7012');

INSERT INTO uber_customers (customerID, customerLast, customerFirst, customerPhone, customerRate, homeID)
    VALUES ('UC9473', 'Jackson', 'David', '6479430271', 2.73, 'UL2049');

INSERT INTO uber_customers (customerID, customerLast, customerFirst, customerPhone, customerRate, homeID)
    VALUES ('UC8023', 'Oliver', 'Jayden', '6476802912', 4.82, 'UL8371');

/* Create an "uber_paymentmethods" table */
CREATE TABLE uber_paymentmethods
(   paymentmethodID CHAR(10),
    customerID      CHAR(8),
    cardType        VARCHAR2(15),
    cardNumber      CHAR(16),
    expiredate      DATE,
    securitycode    CHAR(3),
CONSTRAINT uber_paymentmethods_id_pk primary key (paymentmethodID),
CONSTRAINT uber_paymethods_customer_fk foreign key (customerid)
    REFERENCES uber_customers (customerid));

SELECT * FROM uber_paymentmethods;
DESC uber_paymentmethods;

/* Input data into "uber_paymentmethods" table */
INSERT INTO uber_paymentmethods (paymentmethodID, customerID, cardType, cardNumber, expiredate, securitycode)
    VALUES ('UP0391', 'UC9372', 'Visa', '4382-9832-2303', '2020-03-30', '528'); /* Data Format is 'YYYY-MM-DD' */

INSERT INTO uber_paymentmethods (paymentmethodID, customerID, cardType, cardNumber, expiredate, securitycode)
    VALUES ('UP3563', 'UC0284', 'Visa', '8432-4932-4383', '2025-08-30', '522'); /* Data Format is 'YYYY-MM-DD' */

INSERT INTO uber_paymentmethods (paymentmethodID, customerID, cardType, cardNumber, expiredate, securitycode)
    VALUES ('UP8472', 'UC2381', 'Master', '5483-3294-2942', '2023-04-30', '528'); /* Data Format is 'YYYY-MM-DD' */

INSERT INTO uber_paymentmethods (paymentmethodID, customerID, cardType, cardNumber, expiredate, securitycode)
    VALUES ('UP5472', 'UC7462', 'Master', '8472-4918-4028', '2019-12-30', '736'); /* Data Format is 'YYYY-MM-DD' */

INSERT INTO uber_paymentmethods (paymentmethodID, customerID, cardType, cardNumber, expiredate, securitycode)
    VALUES ('UP9382', 'UC0382', 'Visa', '4500-1839-2032', '2020-07-30', '973'); /* Data Format is 'YYYY-MM-DD' */

INSERT INTO uber_paymentmethods (paymentmethodID, customerID, cardType, cardNumber, expiredate, securitycode)
    VALUES ('UP9478', 'UC5632', 'Visa', '4928-3029-1847', '2022-04-30', '529'); /* Data Format is 'YYYY-MM-DD' */

INSERT INTO uber_paymentmethods (paymentmethodID, customerID, cardType, cardNumber, expiredate, securitycode)
    VALUES ('UP0493', 'UC4392', 'Master', '8392-0938-2093', '2020-12-30', '831'); /* Data Format is 'YYYY-MM-DD' */

INSERT INTO uber_paymentmethods (paymentmethodID, customerID, cardType, cardNumber, expiredate, securitycode)
    VALUES ('UP7458', 'UC6802', 'Master', '6483-0293-1437', '2023-11-30', '802'); /* Data Format is 'YYYY-MM-DD' */
    
INSERT INTO uber_paymentmethods (paymentmethodID, customerID, cardType, cardNumber, expiredate, securitycode)
    VALUES ('UP2451', 'UC9473', 'Visa', '9302-1027-5782', '2019-09-30', '193'); /* Data Format is 'YYYY-MM-DD' */

INSERT INTO uber_paymentmethods (paymentmethodID, customerID, cardType, cardNumber, expiredate, securitycode)
    VALUES ('UP7492', 'UC8023', 'Master', '9383-0392-1246', '2018-12-30', '842'); /* Data Format is 'YYYY-MM-DD' */

/* Create an "uber_drivers" table */
CREATE TABLE uber_drivers
(   driverid    CHAR(8),
    driverLast  VARCHAR2(20),
    driverFirst VARCHAR2(20),
    driverPhone CHAR(10),
    driverRate  NUMBER(3,2),
CONSTRAINT uber_drivers_driverid_pk primary key (driverid));

SELECT * FROM uber_drivers;
DESC uber_drivers;

/* Input data into "uber_drivers" table */
INSERT INTO uber_drivers (driverid, driverLast, driverFirst, driverPhone, driverRate)
    VALUES ('UD9281', 'Joseph', 'Gabriel', '6472029438', 4.32);

INSERT INTO uber_drivers (driverid, driverLast, driverFirst, driverPhone, driverRate)
    VALUES ('UD8372', 'Samuel', 'Carter', '6478472901', 4.82);
    
INSERT INTO uber_drivers (driverid, driverLast, driverFirst, driverPhone, driverRate)
    VALUES ('UD9402', 'Anthony', 'John', '6478479202', 4.12);

INSERT INTO uber_drivers (driverid, driverLast, driverFirst, driverPhone, driverRate)
    VALUES ('UD2416', 'Dylan', 'Luke', '6478492021', 4.52);
    
INSERT INTO uber_drivers (driverid, driverLast, driverFirst, driverPhone, driverRate)
    VALUES ('UD8472', 'Henry', 'Andrew', '6478492857', 4.74);

/* Create an "uber_cars" table */
CREATE TABLE uber_cars
(   carid       CHAR(10),
    driverid    CHAR(8),
    carType     VARCHAR2(15),
    carNumber   CHAR(7),
    model       VARCHAR2(10),
    capacity    NUMBER(2),
CONSTRAINT uber_cars_carid_pk primary key (carid),
CONSTRAINT uber_cars_driverid_fk foreign key (driverid)
    REFERENCES uber_drivers (driverid));

SELECT * FROM uber_cars;
DESC uber_cars;

/* Input data into "uber_cars" table */
INSERT INTO uber_cars (carid, driverid, carType, carNumber, model, capacity)
    VALUES ('UCar7251', 'UD9281', 'Sedan', 'AJDK503', 'Accord', 5);

INSERT INTO uber_cars (carid, driverid, carType, carNumber, model, capacity)
    VALUES ('UCar8374', 'UD8372', 'Sedan', 'DKSE831', 'Ciaz', 5);

INSERT INTO uber_cars (carid, driverid, carType, carNumber, model, capacity)
    VALUES ('UCar6720', 'UD9402', 'Hatchback', 'KFJD022', 'Elantra', 5);

INSERT INTO uber_cars (carid, driverid, carType, carNumber, model, capacity)
    VALUES ('UCar9382', 'UD2416', 'MPV', 'JDKE843', 'Rondo', 8);

INSERT INTO uber_cars (carid, driverid, carType, carNumber, model, capacity)
    VALUES ('UCar4829', 'UD8472', 'SUV', 'EOSK603', 'Rav4', 5);

/* Create an "uber_trips" table */
CREATE TABLE uber_trips
(   tripid CHAR(16),
    customerid CHAR(8),
    driverid CHAR(8),
    destinationid CHAR(10),
    pickupid CHAR(10),
    tripdate DATE,
    price NUMBER(5,2),
    TripCstmRate NUMBER(1),
    TripDrvRate NUMBER(1),
    paymentmethodid CHAR(10),
CONSTRAINT uber_trips_tripid_pk primary key (tripid),
CONSTRAINT uber_trips_customerid_fk foreign key (customerid)
    REFERENCES uber_customers (customerid),
CONSTRAINT uber_trips_driverid_fk foreign key (driverid)
    REFERENCES uber_drivers (driverid),
CONSTRAINT uber_trips_destination_fk foreign key (destinationid)
    REFERENCES uber_locations (locationid),
CONSTRAINT uber_trips_pickupid_fk foreign key (pickupid)
    REFERENCES uber_locations (locationid),
CONSTRAINT uber_trips_paymethodid_fk foreign key (paymentmethodid)
    REFERENCES uber_paymentmethods (paymentmethodid));

SELECT * FROM uber_trips;
DESC uber_trips;

/* Input data into "uber_trips" table */
INSERT INTO uber_trips (tripid, customerid, driverid, destinationid, pickupid,
                        tripdate, price, TripCstmRate, TripDrvRate, paymentmethodid)
    VALUES ('UT1029', 'UC9372', 'UD9281', 'UL7123', 'UL9438',
            '2018-01-04', 45.23, 5, 4, 'UP0391'); /* Data Format is 'YYYY-MM-DD' */

INSERT INTO uber_trips (tripid, customerid, driverid, destinationid, pickupid,
                        tripdate, price, TripCstmRate, TripDrvRate, paymentmethodid)
    VALUES ('UT9382', 'UC0284', 'UD8372', 'UL0376', 'UL9381',
            '2017-12-22', 30.92, 4, 5, 'UP3563'); /* Data Format is 'YYYY-MM-DD' */
            
INSERT INTO uber_trips (tripid, customerid, driverid, destinationid, pickupid,
                        tripdate, price, TripCstmRate, TripDrvRate, paymentmethodid)
    VALUES ('UT0385', 'UC2381', 'UD9402', 'UL2956', 'UL0282',
            '2017-12-15', 62.72, 5, 5, 'UP8472'); /* Data Format is 'YYYY-MM-DD' */

INSERT INTO uber_trips (tripid, customerid, driverid, destinationid, pickupid,
                        tripdate, price, TripCstmRate, TripDrvRate, paymentmethodid)
    VALUES ('UT7462', 'UC7462', 'UD2416', 'UL2382', 'UL7012',
            '2018-01-05', 53.84, 3, 4, 'UP5472'); /* Data Format is 'YYYY-MM-DD' */
            
INSERT INTO uber_trips (tripid, customerid, driverid, destinationid, pickupid,
                        tripdate, price, TripCstmRate, TripDrvRate, paymentmethodid)
    VALUES ('UT8372', 'UC0382', 'UD8472', 'UL2049', 'UL8371',
            '2017-11-29', 30.72, 5, 5, 'UP9382'); /* Data Format is 'YYYY-MM-DD' */

/* UBER Fare Procedure */
CREATE OR REPLACE
PROCEDURE u_fare
    (p_cartype IN uber_cars.carid%TYPE,
     p_distance IN NUMBER,
     p_fare OUT NUMBER)
AS
BEGIN
    IF p_cartype = 'UCar7251' THEN
       p_fare := 10 * p_distance;
    ELSIF p_cartype = 'UCar8374' THEN
          p_fare := 10 * p_distance;
    ELSIF p_cartype = 'UCar6720' THEN
          p_fare := 8 * p_distance; 
    ELSIF p_cartype = 'UCar9382' THEN
          p_fare := 7 * p_distance;
    ELSIF p_cartype = 'UCar4829' THEN
          p_fare := 9 * p_distance;
    else
        p_fare := 8 * p_distance;
    END IF;
END u_fare;

DROP PROCEDURE u_fare;


DECLARE
    u_totalfare NUMBER(5,2);
BEGIN
    u_farerate('UCar7251', 3, u_totalfare);
    DBMS_OUTPUT.PUT_LINE('TOTAL FARE = ' || u_totalfare);
END;