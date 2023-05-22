# Проектирование базы данных для книжного магазина

![MySQL](https://img.shields.io/badge/MySQL-%2307405e.svg?style=for-the-badge&logo=MySQL&logoColor=E6882E)

База данных будет состоять из следующих таблиц:

## Таблица "Employees"

Таблица содержит информацию о информацию о сотрудниках отеля. Она содержит идентификатор сотрудника, имя, фамилию, отчество, адрес электронной почты, номер телефона, дату рождения, пол, идентификатор должности, дату создания записи.

| Поле      | Тип данных | Описание                               |
|-----------|------------|----------------------------------------|
|employee_id 	|int(11)	|Идентификатор сотрудника|
|first_name	|varchar(30)	|Имя сотрудника|
|last_name	|varchar(30)	|Фамилия сотрудника|
|middle_name	|varchar(30)	|Отчество сотрудника|
|Email|varchar(40)|Адрес электронной почты|
|phone  	|varchar(20)	|Номер телефона сотрудника|
|date_of_birth |date |Дата рождения сотрудника|
|gender	|enum('male', 'female')	|Пол сотрудника|
|position_id	|	int(11)	|Идентификатор должности|
|created_at|timestamp |Дата и время создания записи|

## Таблица "Clients"

Таблица содержит информацию о клиентах отеля. Она содержит идентификатор клиента, имя, фамилию, отчество, адрес электронной почты, номер телефона, дату рождения, пол, паспортные данные и дату создания записи.

| Поле      | Тип данных | Описание                               |
|-----------|------------|----------------------------------------|
|client_id	|int(11)	|Идентификатор клиента|
|first_name	|	varchar(30)	|Имя клиента|
|last_name	|varchar(30)	|Фамилия клиента|
|middle_name	|varchar(30)	|Отчество клиента|
|email |varchar(50)|Адрес электронной почты|
|phone |varchar(20)|Номер телефона клиента|
|date_of_birth|date|Дата рождения клиента|
|gender|enum('male', 'female')|Пол клиента|
|passport |varchar(50)|Данные паспорта клиента|
|created_at|	timestamp|Дата и время создания записи|

## Таблица "Hotel_rooms"

Таблица содержит информацию о номерах отеля. Она содержит идентификатор номера, номер комнаты, тип номера, стоимость номера за ночь и статус номера.

| Поле      | Тип данных | Описание                               |
|-----------|------------|----------------------------------------|
|room_id 	|	int(11)	|Идентификатор номера|
|room_number 	|smallint(6)	|Номер комнаты|
|room_type	|enum('standart', 'comfort', 'family', 'business', 'presidential')	|Тип номера|
|room_price_per_night	|decimal(10,2)	|Цена за одну ночь проживания|
|room_status	|	enum('free', 'booked', 'serviced')	|Статус комнаты|


## Таблица "Bookings"

Таблица содержит информацию о бронированиях. Она содержит идентификатор бронирования, идентификатор клиента, идентификатор сотрудника, идентификатор номера, дату заезда, дату выезда, количество гостей, статус бронирования и дату создания записи.

| Поле      | Тип данных | Описание                               |
|-----------|------------|----------------------------------------|
|booking_id 	|int	|Идентификатор бронирования|
|customer_id 	|date	|Идентификатор клиента|
|employee_id 	|int	|Идентификатор сотрудника|
|room_id 	|int	|Идентификатор номера|
|check_in_date|date|Дата заезда|
|check_out_date|date|Дата выезда|
|number_of_guests|int(11)|Количество гостей|
|booking_status|enum('reserved','checked_in','checked_out','cancelled')|Статус бронирования|
|created_at|	timestamp|Дата и время создания записи|

## Таблица "Positions"

Таблица содержит информацию о должностях сотрудников отеля. Она содержит идентификатор должности, название должности, заработная плата должности.

| Поле      | Тип данных | Описание                               |
|-----------|------------|----------------------------------------|
|position_id 	|int(11)	|Идентификатор должности|
|position	|varchar(50)	|Название должности|
|salary	|decimal(10,2)	|Размер заработной платы|


## Таблица "Payments"

Таблица содержит информацию об оплатах. Она содержит идентификатор платежа, идентификатор бронирования, сумму, метод оплаты и дату создания записи.

| Поле      | Тип данных | Описание                               |
|-----------|------------|----------------------------------------|
|payment_id 	|int(11)	|Идентификатор платежа|
|booking_id 	|	int(11)	|Идентификатор бронирования|
|amount	|	decimal(10,2)	|Сумма платежа|
|payment_method   |enum('credit_card', 'debit_card', 'cash')   |Метод оплаты платежа|
|created_at|timestamp|Дата и время создания записи о платеже|




## Взаимосвязи:

![image](https://sun9-29.userapi.com/impg/HvBYOEQMKMTZHBma-pUnSBnqLgSej0h6ieAr1w/EdfJIGyBnY0.jpg?size=1280x710&quality=96&sign=aeaa906a2ef0acf2ea289b80e87055b7&type=album)


* Один сотрудник может занимать только одну должность, но на одной должности может работать несколько сотрудников.
* Один сотрудник может обслуживать несколько бронирований, но каждое бронирование обслуживается только одним сотрудником.
* Один клиент может забронировать несколько номеров в разные периоды, но каждое бронирование может быть сделано только одним клиентом.
* Один номер может быть забронирован несколько раз в разные периоды, но каждое бронирование может быть только для одного номера.
* Каждое бронирование может быть связано только с одним платежом, и каждый платеж может быть связан только с одним бронированием.

## Представления:

1. Список номеров по типу и статусу (search_Hotel_rooms):

Представление позволяет получить информацию о номерах. Оно отображает номера по типу и статусу.

```sql
CREATE VIEW search_Hotel_rooms AS SELECT r.room_id, r.room_number, r.room_type, r.room_price_per_night, r.room_status FROM Hotel_rooms r;
```

2. Список сотрудников с их должностями и зарплатами(Employees_list):

Представление позволяет получить информацию о сотрудниках. Оно отображает должности и зарплаты  всех сотрудников.

```sql
CREATE VIEW Employees_list AS
SELECT 
    CONCAT_WS(' ', first_name, last_name, IFNULL(middle_name, '')) AS full_name,
    position,
    salary
FROM 
    staff 
    JOIN Positions ON Employees.position_id = Positions.position_id;
```

3. Заработок отеля за последний месяц():

Представление позволяет получить информацию о заработке отеля за последний месяц.

```sql
CREATE VIEW Hotel_earnings_for_the_last_month AS SELECT SUM(amount) AS total FROM Payments WHERE created_at >= DATE_SUB(NOW(), INTERVAL 1 MONTH);
```

4. 

Представление позволяет получить контактную информацию о клиентах, которые зарезервировали номер, а также идентификатор номера. 

```sql
CREATE VIEW Clients_who_have_booked_rooms AS SELECT CONCAT_WS(' ', first_name, last_name, IFNULL(middle_name, '')) AS full_name, b.room_id, c.email, c.phone FROM Clients c INNER JOIN Bookings b ON c.customer_id = b.customer_id WHERE b.booking_status = 'reserved';
```


## Код SQL для создания таблиц:

```sql
CREATE TABLE `Positions` (
  `position_id` int NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `position` varchar(50) NOT NULL,
  `salary` decimal(10,2) NOT NULL
);

CREATE TABLE `Employees` (
  `employee_id` int NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `middle_name` varchar(30) DEFAULT NULL,
  `email` varchar(50) UNIQUE NOT NULL,
  `phone` varchar(20) UNIQUE NOT NULL,
  `date_of_birth` date NOT NULL,
  `gender` enum('male','female') NOT NULL,
  `position_id` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`position_id`) REFERENCES `Positions` (`position_id`)
);

CREATE TABLE `Clients` (
  `customer_id` int NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `middle_name` varchar(30) DEFAULT NULL,
  `email` varchar(50) UNIQUE NOT NULL,
  `phone` varchar(20) UNIQUE NOT NULL,
  `date_of_birth` date NOT NULL,
  `gender` enum('male','female') NOT NULL,
  `passport` varchar(50) UNIQUE NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `Hotel_rooms` (
  `room_id` int NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `room_number` smallint UNIQUE NOT NULL,
  `room_type` enum('standart', 'comfort', 'family', 'business', 'presidential') NOT NULL,
  `room_price_per_night` decimal(10,2) NOT NULL,
  `room_status` enum('free','booked','serviced') NOT NULL DEFAULT 'free'
);

CREATE TABLE `Bookings` (
  `booking_id` int NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `employee_id` int NOT NULL,
  `room_id` int NOT NULL,
  `check_in_date` date NOT NULL,
  `check_out_date` date NOT NULL,
  `num_of_guests` int NOT NULL,
  `booking_status` enum('reserved','checked_in','checked_out','cancelled') NOT NULL DEFAULT 'reserved',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `Clients` (`customer_id`),
  CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `Employees` (`employee_id`),
  CONSTRAINT `bookings_ibfk_3` FOREIGN KEY (`room_id`) REFERENCES `Hotel_rooms` (`room_id`)
);

CREATE TABLE `Payments` (
  `payment_id` int NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `booking_id` int UNIQUE NOT NULL, 
  `amount` decimal(10,2) NOT NULL,
  `payment_method` enum('credit_card','debit_card','cash') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `Bookings` (`booking_id`)
);
```
# Примеры запросов SQL для типовых операций:

## Positions

###  Создание записи в таблице Positions

```sql
INSERT INTO Positions (position, salary) VALUES 
('Администратор отеля', 100000.00),
('Швейцар', 35000.00),
('Горничная ', 50000.00),
('Повар ', 60000.00),
('Консьерж', 45000.00);
```
Этот запрос создает записи с информацией о должностях и их зарплатах.

### Изменение записи в таблице Positions

```sql
UPDATE `Positions` SET salary=25000.00 WHERE position_id= 2;
```

Этот запрос изменяет заработную плату у занимаемой должности.

### Удаление записи из таблицы Positions

```sql
DELETE FROM `Positions` WHERE `position_id` = 5;
```

Этот запрос удаляет информацию о  должности с идентификатором 5

## Employees

### Создание записи в таблице Employees

```sql
INSERT INTO `Employees` (first_name, last_name, middle_name, email, phone, date_of_birth, gender, position_id) 
VALUES ('Артём', 'Быстров', 'Денисович', 'artem@gmail.com', '89500500344', '2003-09-08', 'male', 3);
```

Этот запрос создает запись с информацией о сотруднике.

### Изменение записи в таблице Employees

```sql
UPDATE `Employees` SET email='bistrof@example.com' WHERE employee_id = 2;
```

Этот запрос изменяет email сотрудника, у которого идентификатор равен 2.



### Удаление записи из таблицы Employees

```sql
DELETE FROM `Employees` WHERE employee_id= 3;
```

Этот запрос удаляет запись о сотруднике с идентификатором 3.

## Clients

### Создание записи в таблице Clients

```sql
INSERT INTO `Clients` (first_name, last_name, middle_name, email, phone, date_of_birth, gender, passport) VALUES ('Данила', 'Иващенко', 'Максимович', 'danila@vs.com', '89500490345', '2000-01-04', 'male', '134679852');
```

Этот запрос добавляет информацию о клиенте.

### Изменение записи в таблице Clients

```sql
UPDATE `Clients` SET phone='89500498745' WHERE customer_id = 2;
```

Этот запрос изменяет номер телефона у клиента с идентификатором 2.

### Удаление записи из таблицы Clients

```sql
DELETE FROM `Clients` WHERE customer_id = 2;
```

Этот запрос удаляет запись о клиенте с идентификатором 2.

## Hotel_rooms

### Создание записи в таблице Hotel_rooms

```sql
INSERT INTO `Hotel_rooms` (room_number, room_type, room_price_per_night, room_status) VALUES (203, 'comfort', 2500.00, 'free');
```

Этот запрос добавляет информацию о номере.

### Изменение записи в таблице Hotel_rooms

```sql
UPDATE `Hotel_rooms` SET room_price_per_night=3000.00 WHERE room_id= 3;
```

Этот запрос изменяет информацию о номере с идентификатором 3.

### Удаление записи из таблицы Hotel_rooms

```sql
DELETE FROM `Hotel_rooms` WHERE room_number = 203;
```

Этот запрос удаляет запись о комнате с номером 203.

## Bookings

### Добавление бронирования номера в таблицу Bookings

```sql
INSERT INTO bookings (customer_id, employee_id, room_id, check_in_date, check_out_date, num_of_guests, booking_status) 
VALUES (1, 1, 1, '2023-06-01', '2023-06-03', 1, 'reserved');
```

## Payments

### Добавление платежа в таблицу Payments

```sql
INSERT INTO payments (booking_id, amount, payment_method) 
VALUES (1, 2000.00, 'credit_card');
```

## Изменение статусов 

### Изменение статуса номера в таблице Hotel_rooms

```sql
UPDATE `Hotel_rooms` SET room_status='booked' WHERE room_id= 1;
```

### Изменение статуса бронирования таблице Bookings

```sql
UPDATE `Hotel_rooms` SET room_status='booked' WHERE room_id= 1;
```