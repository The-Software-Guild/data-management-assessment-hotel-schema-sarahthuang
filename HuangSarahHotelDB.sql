DROP DATABASE IF EXISTS HuangSarahHotelDB;
CREATE DATABASE HuangSarahHotelDB;
USE HuangSarahHotelDB;

CREATE TABLE guest (
    guestID INT AUTO_INCREMENT,
    firstName VARCHAR(25) NOT NULL,
    lastName VARCHAR(25) NOT NULL,
    `address` VARCHAR(150) NOT NULL,
    city VARCHAR(25) NOT NULL,
    `state` CHAR(3) NOT NULL,
    zip INT NOT NULL,
    phoneNumber VARCHAR(25) NOT NULL,
    CONSTRAINT pk_guest
        PRIMARY KEY (guestID)
)

CREATE TABLE ammenities (
    ammenitiesID INT AUTO_INCREMENT,
    microwave TINYINT(1),
    refridgerator TINYINT(1),
    jacuzzi TINYINT(1),
    oven TINYINT(1),
    CONSTRAINT pk_ammenities
        PRIMARY KEY (ammenitiesID)
)

CREATE TABLE room_type (
    room_type_ID INT AUTO_INCREMENT,
    type_description VARCHAR(25) NOT NULL,
    CONSTRAINT pk_room_type
        PRIMARY KEY (room_type_ID)
)

CREATE TABLE room (
    roomID INT AUTO_INCREMENT,
    room_number INT NOT NULL,
    room_type_ID INT NOT NULL,
    ada_access TINYINT(1),
    standard_occupants INT,
    max_occupants INT,
    base_price DECIMAL(5,2),
    extra_person DECIMAL(4,2)
    CONSTRAINT pk_room
        PRIMARY KEY (roomID)
    CONSTRAINT fk_room_type
        FOREIGN KEY (room_type_ID)
        REFERENCES room_type(room_type_ID)
)

DROP TABLE IF EXISTS room_ammenities;
CREATE TABLE room_ammenities (
    roomID INT,
    ammenitiesID INT,
    CONSTRAINT pk_room_ammenities
    	PRIMARY KEY (roomID, ammenitiesID),
    CONSTRAINT fk_room_ammenities_room
    	FOREIGN KEY (roomID)
    	REFERENCES room(roomID),
    CONSTRAINT fk_room_ammenities_ammenities
    	FOREIGN KEY (ammenitiesID)
    	REFERENCES ammenities(ammenitiesID)
);

CREATE TABLE reservation (
    reservationID INT AUTO_INCREMENT,
    guestID INT,
    roomID INT,
    adults INT,
    children INT,
    startDate DATE,
    endDate DATE,
    total DECIMAL(10, 2)
    CONSTRAINT pk_reservation
        PRIMARY KEY reservationID,
    CONSTRAINT fk_reservation_guest
        FOREIGN KEY (guestID)
        REFERENCES guest(guestID),
    CONSTRAINT fk_reservation_room
        FOREIGN KEY (roomID)
        REFERENCES room(roomID),
)

INSERT INTO `guest` VALUES 
(1,'Sarah','Huang','4 Berberis Dr.','Old Lyme','CT',6371,'(860) 882-3821'),
(2,'Mack','Simmer','379 Old Shore Street','Council Bluffs','IA',51501,'(291) 553-0508'),
(3,'Bettyann','Seery','750 Wintergreen Dr.','Wasilla','AK',99654,'(478) 277-9632'),
(4,'Duane','Cullison','9662 Foxrun Lane','Harlingen','TX',78552,'(308) 494-0198'),
(5,'Karie','Yang','9378 W. Augusta Ave.','West Deptford','NJ',8096,'(214) 730-0298'),
(6,'Aurore','Lipton','762 Wild Rose Street','Sagi0.00w','MI',48601,'(377) 507-0974'),
(7,'Zachery','Luechtefeld','7 Poplar Dr.','Arvada','CO',80003,'(814) 485-2615'),
(8,'Jeremiah','Pendergrass','70 Oakwood St.','Zion','IL',60099,'(279) 491-0960'),
(9,'Walter','Holaway','7556 Arrowhead St.','Cumberland','RI',2864,'(446) 396-6785'),
(10,'Wilfred','Vise','77 West Surrey Street','Oswego','NY',13126,'(834) 727-1001'),
(11,'Maritza','Tilton','939 Linda Rd.','Burke','VA',22015,'(446) 351-6860'),
(12,'Joleen','Tison','87 Queen St.','Drexel Hill','PA',19026,'(231) 893-2755');

INSERT INTO `ammenities` VALUES 
(1,1,0,0,0),(2,0,0,1,0),(3,0,1,0,0),(4,2,0,0,0),(5,0,0,2,0),(6,0,2,0,0),(7,3,0,0,0),(8,0,3,0,0),(9,0,0,3,0),(10,4,0,0,0),(11,0,4,0,0),(12,5,0,0,0),(13,0,5,0,0),(14,0,0,4,0),(15,6,0,0,0),(16,0,6,0,0),(17,7,0,0,0),(18,0,0,5,0),(19,0,7,0,0),(20,8,0,0,0),(21,0,0,6,0),(22,0,8,0,0),(23,9,0,0,0),(24,0,9,0,0),(25,0,0,7,0),(26,10,0,0,0),(27,0,10,0,0),(28,11,0,0,0),(29,0,11,0,0),(30,0,0,8,0),(31,12,0,0,0),(32,0,12,0,0),(33,13,0,0,0),(34,0,13,0,0),(35,0,0,0,1),(36,14,0,0,0),(37,0,14,0,0),(38,0,0,0,2);

INSERT INTO `room_type` VALUES (1,'Single'),(2,'Double'),(3,'Suite');

INSERT INTO `room` VALUES 
(1,201,2,0,2,4,199.99,10.00),
(2,202,2,1,2,4,174.99,10.00),
(3,203,2,0,2,4,199.99,10.00),
(4,204,2,1,2,4,174.99,10.00),
(5,205,1,0,2,2,174.99,0.00),
(6,206,1,1,2,2,149.99,0.00),
(7,207,1,0,2,2,174.99,0.00),
(8,208,1,1,2,2,149.99,0.00),
(9,301,2,0,2,4,199.99,10.00),
(10,302,2,1,2,4,174.99,10.00),
(11,303,2,0,2,4,199.99,10.00),
(12,304,2,1,2,4,174.99,10.00),
(13,305,1,0,2,2,174.99,0.00),
(14,306,1,1,2,2,149.99,0.00),
(15,307,1,0,2,2,174.99,0.00),
(16,308,1,1,2,2,149.99,0.00),
(17,401,3,1,3,8,399.99,20.00),
(18,402,3,1,3,8,399.99,20.00);

INSERT INTO `room_amenities` VALUES (1,1),(1,2),(2,3),(3,4),(3,5),(4,6),(5,7),(5,8),(5,9),(6,10),(6,11),(7,12),(7,13),(7,14),(8,15),(8,16),(9,17),(9,18),(10,19),(11,20),(11,21),(12,22),(13,23),(13,24),(13,25),(14,26),(14,27),(15,28),(15,29),(15,30),(16,31),(16,32),(17,33),(17,34),(17,35),(18,36),(18,37),(18,38);

INSERT INTO `reservation` VALUES 
(1,2,16,1,0,'2023-02-02','2023-02-04',299.98),
(2,3,3,2,1,'2023-02-05','2023-02-10',999.95),
(3,4,13,2,0,'2023-02-22','2023-02-24',349.98),
(4,5,1,2,2,'2023-03-06','2023-03-07',199.99),
(5,1,15,1,1,'2023-03-17','2023-03-20',524.97),
(6,6,10,3,0,'2023-03-18','2023-03-23',924.95),
(7,7,2,2,2,'2023-03-29','2023-03-31',349.98),
(8,8,12,2,0,'2023-03-31','2023-04-05',874.95),
(9,9,9,1,0,'2023-04-09','2023-04-13',799.96),
(10,10,7,1,1,'2023-04-23','2023-04-24',174.99),
(12,12,6,2,0,'2023-06-10','2023-06-14',599.96),
(13,12,8,1,0,'2023-06-10','2023-06-14',599.96),
(14,6,12,3,0,'2023-06-17','2023-06-18',184.99),
(15,1,5,2,0,'2023-06-28','2023-07-02',699.96),
(16,9,4,3,1,'2023-07-13','2023-07-14',184.99),
(18,3,11,2,1,'2023-07-28','2023-07-29',199.99),
(19,3,13,1,0,'2023-08-30','2023-09-01',349.98),
(20,2,8,2,0,'2023-09-16','2023-09-17',149.99),
(21,5,3,2,2,'2023-09-13','2023-09-15',399.98),
(23,2,6,2,0,'2023-11-22','2023-11-25',449.97),
(24,2,9,2,2,'2023-11-22','2023-11-25',599.97),
(25,11,10,2,0,'2023-12-24','2023-12-28',699.96);

--Find Jeremiah Pendergrass's guestID via the guest table
SELECT * FROM guest
WHERE firstName = "Jeremiah" AND lastName = "Pendergrass";

--Checking records in reservation with guestID = 8
SELECT COUNT(*)
FROM reservation
WHERE guestID = 8;

--Delete Jeremiah Pendergrass from reservation
DELETE FROM reservation
WHERE guestID = 8;

--Verify count in reservation is 0 where guestID = 8
SELECT COUNT(*)
FROM reservation
WHERE guestID = 8;

--Checking records with guestID = 8
SELECT COUNT(*)
FROM guest
WHERE guestID = 8;

--Delete Jeremiah Pendergrass from the guest table
DELETE FROM guest
WHERE guestID = 8;

--Verify count in reservation is 0 where guestID = 8
SELECT COUNT(*)
FROM guest
WHERE guestID = 8;

--Query 1:
SELECT guest.firstName, guest.lastName, room.room_number, reservation.startDate, reservation.endDate FROM reservation 
JOIN guest
ON guest.guestID = reservation.guestID
JOIN room
ON room.roomID = reservation.roomID
WHERE reservation.endDate < "2023-08-01" AND reservation.endDate > "2023-07-01";

--Query 2:
SELECT guest.firstName, guest.lastName, room.room_number, reservation.startDate, reservation.endDate FROM amenities
JOIN room_amenities
ON amenities.amenitiesID = room_amenities.amenitiesID
JOIN room
ON room.roomID = room_amenities.roomID
JOIN reservation
ON reservation.roomID = room.roomID
JOIN guest
ON guest.guestID = reservation.guestID
WHERE jacuzzi > 0;

--Query 3: guest 2 (Mack Simmer)
SELECT guest.firstName, guest.lastName, room.room_number, reservation.startDate, (reservation.adults + reservation.children) AS total_guests
FROM guest
JOIN reservation
ON guest.guestID = reservation.guestID
JOIN room
ON room.roomID = reservation.roomID
WHERE guest.guestID = 2;

--Query 4:
SELECT room.room_number, reservation.reservationID, room.base_price
FROM room
LEFT JOIN reservation
ON room.roomID = reservation.roomID;

--Query 5:
SELECT room.roomID, room.room_number, room.max_occupants, reservation.startDate, reservation.endDate
FROM room
JOIN reservation
ON room.roomID = reservation.roomID
WHERE reservation.startDate > "2023-03-30" and reservation.endDate < "2023-05-01"
AND room.max_occupants > 3;

--Query 6:
SELECT guest.guestID, guest.firstName, guest.lastName, COUNT(reservation.guestID) AS total_reservations
FROM guest
JOIN reservation
ON guest.guestID = reservation.guestID
GROUP BY guest.guestID, guest.firstName, guest.lastName
ORDER BY total_reservations DESC, guest.lastName;

--Query 7: guest 1, Sarah Huang
SELECT guest.firstName, guest.lastName, guest.address, guest.phoneNUmber FROM HuangSarahHotelDB.guest
WHERE phoneNumber LIKE "%(4%";

SELECT guest.firstName, guest.lastName, guest.address, guest.phoneNUmber FROM HuangSarahHotelDB.guest
WHERE phoneNumber = "(860) 882-3821";