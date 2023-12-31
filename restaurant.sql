-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Дек 20 2023 г., 00:43
-- Версия сервера: 5.5.25
-- Версия PHP: 5.3.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `restaurant`
--

-- --------------------------------------------------------

--
-- Структура таблицы `chef`
--

CREATE TABLE IF NOT EXISTS `chef` (
  `ChefId` int(11) NOT NULL,
  `ChefName` varchar(255) NOT NULL,
  `ClockInTime` time NOT NULL,
  `ClockOutTime` time NOT NULL,
  PRIMARY KEY (`ChefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `chef`
--

INSERT INTO `chef` (`ChefId`, `ChefName`, `ClockInTime`, `ClockOutTime`) VALUES
(30456, 'Лена', '08:00:23', '17:00:05'),
(30457, 'Даниил', '09:30:00', '19:30:45'),
(30458, 'Лариса', '08:00:01', '17:30:00'),
(30459, 'Ли', '07:30:33', '16:00:03'),
(30460, 'Борис', '10:00:20', '05:01:20'),
(30461, 'Данил', '09:02:45', '19:00:50');

-- --------------------------------------------------------

--
-- Структура таблицы `consistsof`
--

CREATE TABLE IF NOT EXISTS `consistsof` (
  `OrderId` int(11) NOT NULL,
  `MealId` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  KEY `OrderId` (`OrderId`),
  KEY `MealId` (`MealId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `consistsof`
--

INSERT INTO `consistsof` (`OrderId`, `MealId`, `Quantity`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 2, 1),
(4, 3, 1),
(5, 4, 2),
(6, 5, 1),
(7, 2, 1),
(8, 3, 3),
(9, 1, 1),
(10, 4, 2),
(11, 1, 1),
(12, 5, 1),
(13, 3, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `customer`
--

CREATE TABLE IF NOT EXISTS `customer` (
  `CustomerId` int(11) NOT NULL,
  `CustomerName` varchar(255) NOT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `WaiterId` int(11) DEFAULT NULL,
  PRIMARY KEY (`CustomerId`),
  KEY `WaiterId` (`WaiterId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `customer`
--

INSERT INTO `customer` (`CustomerId`, `CustomerName`, `Address`, `WaiterId`) VALUES
(9123410, 'Саша', 'ул. Квартал 7м 24', 21),
(9123411, 'Филипп', 'Пр. Октября 54', 20),
(9123412, 'Генадий', 'ул. Заки Валиди 25', 20),
(9123456, 'Николай', 'Пр.Октября 10', 20),
(9123457, 'Рита', 'ул. Ленина 10', 21),
(9123458, 'Маша', 'ул. Кедровая 6', 22),
(9123459, 'Руслан', 'ул. Карпинского 2', 20);

-- --------------------------------------------------------

--
-- Структура таблицы `ingredients`
--

CREATE TABLE IF NOT EXISTS `ingredients` (
  `IngredientsId` int(11) NOT NULL,
  `IngredientsName` varchar(255) NOT NULL,
  `ManufactureDate` date NOT NULL,
  `ExpiryDate` date NOT NULL,
  `Quantity` int(11) NOT NULL,
  PRIMARY KEY (`IngredientsId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ingredients`
--

INSERT INTO `ingredients` (`IngredientsId`, `IngredientsName`, `ManufactureDate`, `ExpiryDate`, `Quantity`) VALUES
(234, 'Хумус', '2023-02-15', '2023-06-25', 5),
(235, 'Соус Маринара', '2023-03-20', '2024-03-20', 3),
(236, 'Сыр Чеддер', '2023-03-24', '2023-06-02', 6),
(237, 'Сыр Моцарелла', '2023-03-24', '2023-05-25', 3),
(238, 'Кунжутное масло', '2023-06-26', '2024-02-19', 7),
(239, 'Сливки', '2023-07-01', '2023-05-10', 5),
(240, 'Паста', '2023-09-26', '2023-12-26', 8);

-- --------------------------------------------------------

--
-- Структура таблицы `instructs`
--

CREATE TABLE IF NOT EXISTS `instructs` (
  `MId` int(11) NOT NULL,
  `ChefId` int(11) NOT NULL,
  KEY `MId` (`MId`),
  KEY `ChefId` (`ChefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `instructs`
--

INSERT INTO `instructs` (`MId`, `ChefId`) VALUES
(12345, 30456),
(12345, 30457),
(12345, 30458),
(12346, 30457),
(12346, 30458),
(12346, 30459),
(12347, 30458),
(12347, 30459),
(12347, 30460),
(12347, 30461);

-- --------------------------------------------------------

--
-- Структура таблицы `manager`
--

CREATE TABLE IF NOT EXISTS `manager` (
  `MId` int(11) NOT NULL,
  `MName` varchar(255) NOT NULL,
  `Address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`MId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `manager`
--

INSERT INTO `manager` (`MId`, `MName`, `Address`) VALUES
(12345, 'Эдуард', 'Пр. Октября 15'),
(12346, 'Александр', 'Заки Валиди 105'),
(12347, 'Кристина', 'Пр.Октября 6');

-- --------------------------------------------------------

--
-- Структура таблицы `meal`
--

CREATE TABLE IF NOT EXISTS `meal` (
  `MealId` int(11) NOT NULL,
  `MealName` varchar(255) NOT NULL,
  `Price` int(11) NOT NULL,
  PRIMARY KEY (`MealId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `meal`
--

INSERT INTO `meal` (`MealId`, `MealName`, `Price`) VALUES
(1, 'Сэндвич', 15),
(2, 'Чесночный сэндвич', 8),
(3, 'Панини', 14),
(4, 'Сырный панини', 10),
(5, 'Сырные крутоны', 4);

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `OrderId` int(11) NOT NULL,
  `ChefId` int(11) NOT NULL,
  `CustomerId` int(11) NOT NULL,
  PRIMARY KEY (`OrderId`),
  KEY `ChefId` (`ChefId`),
  KEY `CustomerId` (`CustomerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`OrderId`, `ChefId`, `CustomerId`) VALUES
(1, 30456, 9123411),
(2, 30458, 9123456),
(3, 30461, 9123458),
(4, 30459, 9123459),
(5, 30460, 9123456),
(6, 30459, 9123412),
(7, 30456, 9123458),
(8, 30460, 9123456),
(9, 30461, 9123410),
(10, 30460, 9123456),
(11, 30461, 9123457),
(12, 30457, 9123411),
(13, 30458, 9123412);

-- --------------------------------------------------------

--
-- Структура таблицы `payment`
--

CREATE TABLE IF NOT EXISTS `payment` (
  `PaymentId` int(11) NOT NULL,
  `Price` int(11) NOT NULL,
  `PaymentDate` date NOT NULL,
  `PaymentMode` varchar(255) DEFAULT NULL,
  `CustomerId` int(11) NOT NULL,
  `OrderId` int(11) NOT NULL,
  PRIMARY KEY (`PaymentId`),
  KEY `CustomerId` (`CustomerId`),
  KEY `OrderId` (`OrderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `payment`
--

INSERT INTO `payment` (`PaymentId`, `Price`, `PaymentDate`, `PaymentMode`, `CustomerId`, `OrderId`) VALUES
(10150, 26, '2022-05-02', 'карта', 9123410, 1),
(10151, 11, '2022-05-02', 'карта', 9123458, 2),
(10152, 17, '2022-05-02', 'карта', 9123459, 3),
(10153, 23, '2022-05-02', 'карта', 9123412, 4),
(10154, 7, '2022-05-02', 'карта', 9123411, 5),
(10155, 11, '2022-05-02', 'наличные', 9123457, 6),
(10156, 45, '2022-05-02', 'наличные', 9123456, 7),
(10157, 18, '2022-05-02', 'наличные', 9123459, 8),
(10158, 23, '2022-05-03', 'наличные', 9123412, 9),
(10159, 22, '2022-05-03', 'наличные', 9123458, 10),
(10160, 17, '2022-05-03', 'карта', 9123458, 11),
(10161, 22, '2022-05-03', 'наличные', 9123456, 12),
(10162, 17, '2022-05-03', 'карта', 9123459, 13);

-- --------------------------------------------------------

--
-- Структура таблицы `requires`
--

CREATE TABLE IF NOT EXISTS `requires` (
  `ChefId` int(11) NOT NULL,
  `IngredientsId` int(11) NOT NULL,
  KEY `ChefId` (`ChefId`),
  KEY `IngredientsId` (`IngredientsId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `requires`
--

INSERT INTO `requires` (`ChefId`, `IngredientsId`) VALUES
(30456, 240),
(30456, 239),
(30456, 234),
(30458, 239),
(30458, 240),
(30456, 234),
(30460, 239),
(30460, 236),
(30460, 237),
(30461, 235),
(30458, 238),
(30458, 239);

-- --------------------------------------------------------

--
-- Структура таблицы `waiter`
--

CREATE TABLE IF NOT EXISTS `waiter` (
  `WaiterId` int(11) NOT NULL,
  `WaiterName` varchar(255) NOT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Salary` int(11) DEFAULT NULL,
  PRIMARY KEY (`WaiterId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `waiter`
--

INSERT INTO `waiter` (`WaiterId`, `WaiterName`, `Address`, `Salary`) VALUES
(20, 'Белла', 'Пр. Октября 21', 500),
(21, 'Женя', 'Ул. Заки Валеди 4', 550),
(22, 'Кристина', 'ул. Искры 7', 500),
(23, 'Эжик', 'ул. Ленина', 400);

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `consistsof`
--
ALTER TABLE `consistsof`
  ADD CONSTRAINT `consistsof_ibfk_1` FOREIGN KEY (`OrderId`) REFERENCES `orders` (`OrderId`),
  ADD CONSTRAINT `consistsof_ibfk_2` FOREIGN KEY (`MealId`) REFERENCES `meal` (`MealId`);

--
-- Ограничения внешнего ключа таблицы `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`WaiterId`) REFERENCES `waiter` (`WaiterId`);

--
-- Ограничения внешнего ключа таблицы `instructs`
--
ALTER TABLE `instructs`
  ADD CONSTRAINT `instructs_ibfk_1` FOREIGN KEY (`MId`) REFERENCES `manager` (`MId`),
  ADD CONSTRAINT `instructs_ibfk_2` FOREIGN KEY (`ChefId`) REFERENCES `chef` (`ChefId`);

--
-- Ограничения внешнего ключа таблицы `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`ChefId`) REFERENCES `chef` (`ChefId`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`CustomerId`) REFERENCES `customer` (`CustomerId`);

--
-- Ограничения внешнего ключа таблицы `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`CustomerId`) REFERENCES `customer` (`CustomerId`),
  ADD CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`OrderId`) REFERENCES `orders` (`OrderId`);

--
-- Ограничения внешнего ключа таблицы `requires`
--
ALTER TABLE `requires`
  ADD CONSTRAINT `requires_ibfk_1` FOREIGN KEY (`ChefId`) REFERENCES `chef` (`ChefId`),
  ADD CONSTRAINT `requires_ibfk_2` FOREIGN KEY (`IngredientsId`) REFERENCES `ingredients` (`IngredientsId`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
