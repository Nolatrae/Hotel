-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Май 22 2023 г., 16:53
-- Версия сервера: 5.7.36-39
-- Версия PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `hotel25`
--

-- --------------------------------------------------------

--
-- Структура таблицы `Bookings`
--

CREATE TABLE `Bookings` (
  `booking_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `check_in_date` date NOT NULL,
  `check_out_date` date NOT NULL,
  `num_of_guests` int(11) NOT NULL,
  `booking_status` enum('reserved','checked_in','checked_out','cancelled') NOT NULL DEFAULT 'reserved',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Bookings`
--

INSERT INTO `Bookings` (`booking_id`, `customer_id`, `employee_id`, `room_id`, `check_in_date`, `check_out_date`, `num_of_guests`, `booking_status`, `created_at`) VALUES
(1, 1, 1, 1, '2023-05-24', '2023-06-01', 1, 'reserved', '2023-05-22 12:31:47');

-- --------------------------------------------------------

--
-- Структура таблицы `Clients`
--

CREATE TABLE `Clients` (
  `customer_id` int(11) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `middle_name` varchar(30) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `date_of_birth` date NOT NULL,
  `gender` enum('male','female') NOT NULL,
  `passport` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Clients`
--

INSERT INTO `Clients` (`customer_id`, `first_name`, `last_name`, `middle_name`, `email`, `phone`, `date_of_birth`, `gender`, `passport`, `created_at`) VALUES
(1, 'Данила', 'Иващенко', 'Максимович', 'danila@vs.com', '89500490345', '2000-01-04', 'male', '134679852', '2023-05-22 12:30:17');

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `Clients_who_have_booked_rooms`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `Clients_who_have_booked_rooms` (
`full_name` varchar(92)
,`room_id` int(11)
,`email` varchar(50)
,`phone` varchar(20)
);

-- --------------------------------------------------------

--
-- Структура таблицы `Employees`
--

CREATE TABLE `Employees` (
  `employee_id` int(11) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `middle_name` varchar(30) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `date_of_birth` date NOT NULL,
  `gender` enum('male','female') NOT NULL,
  `position_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Employees`
--

INSERT INTO `Employees` (`employee_id`, `first_name`, `last_name`, `middle_name`, `email`, `phone`, `date_of_birth`, `gender`, `position_id`, `created_at`) VALUES
(1, 'Артём', 'Быстров', 'Денисович', 'artem@gmail.com', '89500500344', '2003-09-08', 'male', 1, '2023-05-22 12:30:00');

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `Employees_list`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `Employees_list` (
`full_name` varchar(92)
,`position` varchar(50)
,`salary` decimal(10,2)
);

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `Hotel_earnings_for_the_last_month`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `Hotel_earnings_for_the_last_month` (
`total` decimal(32,2)
);

-- --------------------------------------------------------

--
-- Структура таблицы `Hotel_rooms`
--

CREATE TABLE `Hotel_rooms` (
  `room_id` int(11) NOT NULL,
  `room_number` smallint(6) NOT NULL,
  `room_type` enum('standart','comfort','family','business','presidential') NOT NULL,
  `room_price_per_night` decimal(10,2) NOT NULL,
  `room_status` enum('free','booked','serviced') NOT NULL DEFAULT 'free'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Hotel_rooms`
--

INSERT INTO `Hotel_rooms` (`room_id`, `room_number`, `room_type`, `room_price_per_night`, `room_status`) VALUES
(1, 203, 'comfort', '2500.00', 'booked');

-- --------------------------------------------------------

--
-- Структура таблицы `Payments`
--

CREATE TABLE `Payments` (
  `payment_id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_method` enum('credit_card','debit_card','cash') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Payments`
--

INSERT INTO `Payments` (`payment_id`, `booking_id`, `amount`, `payment_method`, `created_at`) VALUES
(1, 1, '2000.00', 'credit_card', '2023-05-22 12:32:03');

-- --------------------------------------------------------

--
-- Структура таблицы `Positions`
--

CREATE TABLE `Positions` (
  `position_id` int(11) NOT NULL,
  `position` varchar(50) NOT NULL,
  `salary` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Positions`
--

INSERT INTO `Positions` (`position_id`, `position`, `salary`) VALUES
(1, 'Администратор отеля', '100000.00'),
(2, 'Швейцар', '35000.00'),
(3, 'Горничная ', '50000.00'),
(4, 'Повар ', '60000.00'),
(5, 'Консьерж', '45000.00');

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `search_Hotel_rooms`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `search_Hotel_rooms` (
`room_id` int(11)
,`room_number` smallint(6)
,`room_type` enum('standart','comfort','family','business','presidential')
,`room_price_per_night` decimal(10,2)
,`room_status` enum('free','booked','serviced')
);

-- --------------------------------------------------------

--
-- Структура для представления `Clients_who_have_booked_rooms`
--
DROP TABLE IF EXISTS `Clients_who_have_booked_rooms`;

CREATE ALGORITHM=UNDEFINED DEFINER=`hotel25`@`localhost` SQL SECURITY DEFINER VIEW `Clients_who_have_booked_rooms`  AS SELECT concat_ws(' ',`c`.`first_name`,`c`.`last_name`,ifnull(`c`.`middle_name`,'')) AS `full_name`, `b`.`room_id` AS `room_id`, `c`.`email` AS `email`, `c`.`phone` AS `phone` FROM (`Clients` `c` join `Bookings` `b` on((`c`.`customer_id` = `b`.`customer_id`))) WHERE (`b`.`booking_status` = 'reserved')  ;

-- --------------------------------------------------------

--
-- Структура для представления `Employees_list`
--
DROP TABLE IF EXISTS `Employees_list`;

CREATE ALGORITHM=UNDEFINED DEFINER=`hotel25`@`localhost` SQL SECURITY DEFINER VIEW `Employees_list`  AS SELECT concat_ws(' ',`Employees`.`first_name`,`Employees`.`last_name`,ifnull(`Employees`.`middle_name`,'')) AS `full_name`, `Positions`.`position` AS `position`, `Positions`.`salary` AS `salary` FROM (`Employees` join `Positions` on((`Employees`.`position_id` = `Positions`.`position_id`)))  ;

-- --------------------------------------------------------

--
-- Структура для представления `Hotel_earnings_for_the_last_month`
--
DROP TABLE IF EXISTS `Hotel_earnings_for_the_last_month`;

CREATE ALGORITHM=UNDEFINED DEFINER=`hotel25`@`localhost` SQL SECURITY DEFINER VIEW `Hotel_earnings_for_the_last_month`  AS SELECT sum(`Payments`.`amount`) AS `total` FROM `Payments` WHERE (`Payments`.`created_at` >= (now() - interval 1 month))  ;

-- --------------------------------------------------------

--
-- Структура для представления `search_Hotel_rooms`
--
DROP TABLE IF EXISTS `search_Hotel_rooms`;

CREATE ALGORITHM=UNDEFINED DEFINER=`hotel25`@`localhost` SQL SECURITY DEFINER VIEW `search_Hotel_rooms`  AS SELECT `r`.`room_id` AS `room_id`, `r`.`room_number` AS `room_number`, `r`.`room_type` AS `room_type`, `r`.`room_price_per_night` AS `room_price_per_night`, `r`.`room_status` AS `room_status` FROM `Hotel_rooms` AS `r``r`  ;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `Bookings`
--
ALTER TABLE `Bookings`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `bookings_ibfk_1` (`customer_id`),
  ADD KEY `bookings_ibfk_2` (`employee_id`),
  ADD KEY `bookings_ibfk_3` (`room_id`);

--
-- Индексы таблицы `Clients`
--
ALTER TABLE `Clients`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone` (`phone`),
  ADD UNIQUE KEY `passport` (`passport`);

--
-- Индексы таблицы `Employees`
--
ALTER TABLE `Employees`
  ADD PRIMARY KEY (`employee_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone` (`phone`),
  ADD KEY `staff_ibfk_1` (`position_id`);

--
-- Индексы таблицы `Hotel_rooms`
--
ALTER TABLE `Hotel_rooms`
  ADD PRIMARY KEY (`room_id`),
  ADD UNIQUE KEY `room_number` (`room_number`);

--
-- Индексы таблицы `Payments`
--
ALTER TABLE `Payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD UNIQUE KEY `booking_id` (`booking_id`);

--
-- Индексы таблицы `Positions`
--
ALTER TABLE `Positions`
  ADD PRIMARY KEY (`position_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `Bookings`
--
ALTER TABLE `Bookings`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `Clients`
--
ALTER TABLE `Clients`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `Employees`
--
ALTER TABLE `Employees`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `Hotel_rooms`
--
ALTER TABLE `Hotel_rooms`
  MODIFY `room_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `Payments`
--
ALTER TABLE `Payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `Positions`
--
ALTER TABLE `Positions`
  MODIFY `position_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `Bookings`
--
ALTER TABLE `Bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `Clients` (`customer_id`),
  ADD CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `Employees` (`employee_id`),
  ADD CONSTRAINT `bookings_ibfk_3` FOREIGN KEY (`room_id`) REFERENCES `Hotel_rooms` (`room_id`);

--
-- Ограничения внешнего ключа таблицы `Employees`
--
ALTER TABLE `Employees`
  ADD CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`position_id`) REFERENCES `Positions` (`position_id`);

--
-- Ограничения внешнего ключа таблицы `Payments`
--
ALTER TABLE `Payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `Bookings` (`booking_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
