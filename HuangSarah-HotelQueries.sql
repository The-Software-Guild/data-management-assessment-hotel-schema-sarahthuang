/*Query 1*/
SELECT guest.firstName, guest.lastName, room.room_number, reservation.startDate, reservation.endDate FROM reservation 
JOIN guest
ON guest.guestID = reservation.guestID
JOIN room
ON room.roomID = reservation.roomID
WHERE reservation.endDate < "2023-08-01" AND reservation.endDate > "2023-07-01";

/*Query 2*/
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

/*Query 3: guest 2 (Mack Simmer)*/ 
SELECT guest.firstName, guest.lastName, room.room_number, reservation.startDate, (reservation.adults + reservation.children) AS total_guests
FROM guest
JOIN reservation
ON guest.guestID = reservation.guestID
JOIN room
ON room.roomID = reservation.roomID
WHERE guest.guestID = 2;

/*Query 4*/
SELECT room.room_number, reservation.reservationID, room.base_price
FROM room
LEFT JOIN reservation
ON room.roomID = reservation.roomID;

/*Query 5*/
SELECT room.roomID, room.room_number, room.max_occupants, reservation.startDate, reservation.endDate
FROM room
JOIN reservation
ON room.roomID = reservation.roomID
WHERE reservation.startDate > "2023-03-30" and reservation.endDate < "2023-05-01"
AND room.max_occupants > 3;

/*Query 6*/
SELECT guest.guestID, guest.firstName, guest.lastName, COUNT(reservation.guestID) AS total_reservations
FROM guest
JOIN reservation
ON guest.guestID = reservation.guestID
GROUP BY guest.guestID, guest.firstName, guest.lastName
ORDER BY total_reservations DESC, guest.lastName;

/*Query 7: guest 1, Sarah Huang*/ 
SELECT guest.firstName, guest.lastName, guest.address, guest.phoneNUmber FROM HuangSarahHotelDB.guest
WHERE phoneNumber LIKE "%(4%";

SELECT guest.firstName, guest.lastName, guest.address, guest.phoneNUmber FROM HuangSarahHotelDB.guest
WHERE phoneNumber = "(860) 882-3821";