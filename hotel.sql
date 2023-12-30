CREATE TABLE `bills` (
  `billID` int(50) NOT NULL,
  `reservationID` int(50) NOT NULL,
  `billDate` date NOT NULL,
  `billAmount` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `bills` (`billID`, `reservationID`, `billDate`, `billAmount`) VALUES
(1, 0001, '2023-12-30', 3000),
(2, 0002, '2023-01-01', 1900);

-- --------------------------------------------------------


CREATE TABLE `customers` (
  `customerIDNumber` int(50) NOT NULL,
  `customerName` varchar(50) NOT NULL,
  `customerNationality` varchar(20) NOT NULL,
  `customerGender` varchar(10) NOT NULL,
  `customerPhoneNo` int(50) NOT NULL,
  `customerEmail` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



INSERT INTO `customers` (`customerIDNumber`, `customerName`, `customerNationality`, `customerGender`, `customerPhoneNo`, `customerEmail`) VALUES
(00001, 'Khalil Richa', 'Maroc', 'Male', 0601020304, 'test@gmail.com'),
(00002, 'Yassin Alaoui', 'Maroc', 'Male', 0600000000, 'test@gmail.com');



CREATE TABLE `reservations` (
  `reservationID` int(50) NOT NULL,
  `customerIDNumber` int(10) NOT NULL,
  `roomNumber` varchar(20) NOT NULL,
  `checkInDate` date NOT NULL,
  `checkOutDate` date NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'Checked In'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `reservations` (`reservationID`, `customerIDNumber`, `roomNumber`, `checkInDate`, `checkOutDate`, `status`) VALUES
(1, 0000001, '100', '2023-12-31', '2023-01-20', 'Checked In'),
(2, 0000002, '201', '2023-01-01', '2023-01-27', 'Checked Out');


-- --------------------------------------------------------


CREATE TABLE `rooms` (
  `roomNumber` varchar(20) NOT NULL,
  `roomType` varchar(50) NOT NULL,
  `price` int(20) NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'Not Booked'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



INSERT INTO `rooms` (`roomNumber`, `roomType`, `price`, `status`) VALUES
('100', 'Single', 2000, 'Réservé'),
('101', 'Double', 4000, 'Non réservé'),
('102', 'Single', 1500, 'Réservé'),
('200', 'Family', 4500, 'Non réservé'),
('201', 'Luxury', 6000, 'Réservé'),
('202', 'Double', 3500, 'Non réservé'),
('301', 'Presidential Suite', 20000, 'Non réservé');


-- --------------------------------------------------------


CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `securityQuestion` varchar(100) NOT NULL,
  `answer` varchar(200) NOT NULL,
  `address` varchar(200) NOT NULL,
  `status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `users` (`id`, `name`, `username`, `password`, `gender`, `securityQuestion`, `answer`, `address`, `status`) VALUES
(1, 'Khalil', 'admin', 'admin', 'Male', 'What is the name of your first pet?', 'Rex', 'Rabat', NULL);

ALTER TABLE `bills`
  ADD PRIMARY KEY (`billID`),
  ADD UNIQUE KEY `fk_bills_res` (`reservationID`) USING BTREE;


ALTER TABLE `customers`
  ADD PRIMARY KEY (`customerIDNumber`);


ALTER TABLE `reservations`
  ADD PRIMARY KEY (`reservationID`),
  ADD KEY `fk_customers_res` (`customerIDNumber`),
  ADD KEY `fk_rooms_res` (`roomNumber`);


ALTER TABLE `rooms`
  ADD PRIMARY KEY (`roomNumber`);

ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `bills`
  MODIFY `billID` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;


ALTER TABLE `reservations`
  MODIFY `reservationID` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

ALTER TABLE `bills`
  ADD CONSTRAINT `fk_bills_res` FOREIGN KEY (`reservationID`) REFERENCES `reservations` (`reservationID`) ON UPDATE CASCADE;

ALTER TABLE `reservations`
  ADD CONSTRAINT `fk_customers_res` FOREIGN KEY (`customerIDNumber`) REFERENCES `customers` (`customerIDNumber`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_rooms_res` FOREIGN KEY (`roomNumber`) REFERENCES `rooms` (`roomNumber`) ON UPDATE CASCADE;
COMMIT;
