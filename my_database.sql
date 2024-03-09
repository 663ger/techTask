-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Мар 05 2024 г., 17:03
-- Версия сервера: 10.4.28-MariaDB
-- Версия PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `my_database`
--

-- --------------------------------------------------------

--
-- Структура таблицы `clients`
--

CREATE TABLE `clients` (
  `id_client` int(11) NOT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `middle_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `clients`
--

INSERT INTO `clients` (`id_client`, `first_name`, `middle_name`, `last_name`, `deleted`) VALUES
(1, 'John', 'Doe', 'Smith', 0),
(2, 'Alice', 'Jane', 'Johnson', 0),
(3, 'Bob', 'Michael', 'Brown', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `comments`
--

CREATE TABLE `comments` (
  `id_comment` int(11) NOT NULL,
  `id_issue` int(11) NOT NULL,
  `comment` text DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `issues`
--

CREATE TABLE `issues` (
  `id_issue` int(11) NOT NULL,
  `id_status` int(11) DEFAULT NULL,
  `id_user` int(11) NOT NULL,
  `id_client` int(11) NOT NULL,
  `id_mark` int(11) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `name` varchar(100) DEFAULT NULL,
  `Description` text NOT NULL,
  `start_time` datetime DEFAULT NULL,
  `completion_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `issues`
--

INSERT INTO `issues` (`id_issue`, `id_status`, `id_user`, `id_client`, `id_mark`, `deleted`, `name`, `Description`, `start_time`, `completion_time`) VALUES
(31, 1, 36, 1, NULL, 0, 'Тестовая задача', '', NULL, NULL),
(32, 1, 36, 3, NULL, 0, 'Тестовая задача 2', '', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `marks`
--

CREATE TABLE `marks` (
  `id_mark` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `marks`
--

INSERT INTO `marks` (`id_mark`, `name`) VALUES
(1, 'Высокая'),
(2, 'Средняя'),
(3, 'Низкая');

-- --------------------------------------------------------

--
-- Структура таблицы `messages`
--

CREATE TABLE `messages` (
  `id_messages` int(11) NOT NULL,
  `contact_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `message` text DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleted` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `messages`
--

INSERT INTO `messages` (`id_messages`, `contact_id`, `sender_id`, `message`, `time`, `deleted`) VALUES
(1, 1, 35, 'Hello John!', '2024-01-14 16:05:31', 0),
(2, 2, 35, 'Hi Alice!', '2024-01-14 16:05:31', 0),
(3, 3, 35, 'Hey Bob!', '2024-01-14 16:05:31', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `status`
--

CREATE TABLE `status` (
  `id_status` int(11) NOT NULL,
  `status_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `status`
--

INSERT INTO `status` (`id_status`, `status_name`) VALUES
(1, 'Открыта'),
(2, 'Закрыта'),
(3, 'В процессе');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `ID` int(11) NOT NULL,
  `login` varchar(50) NOT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `middle_name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `session_id` varchar(32) NOT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `creation_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_login_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`ID`, `login`, `first_name`, `last_name`, `middle_name`, `email`, `password`, `session_id`, `deleted`, `creation_time`, `last_login_time`) VALUES
(2, 'testUser', 'Тестик', 'Тестовый', 'Тестович', 'test@mail.ry', '$2y$10$UvsK8FoBpwlkoWJCn0YaUO6K2zowvHm5dqWZqTKKYUr6Z2v6PiLSG', '55a4a35d31749d1564a03c0e1438b007', 0, '2024-02-20 13:43:13', '0000-00-00 00:00:00'),
(35, 'Roma', NULL, NULL, NULL, NULL, '$2y$10$QhJcftA5H8f.DJSdn2ZkMeeMuJ0tpM4QRVcTQZKoUhV3CL8XTPJCS', '94277dcc1d6843a7b5a0f51fbf90aa8b', 0, '2024-02-25 11:32:38', '2024-03-05 15:54:01');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id_client`);

--
-- Индексы таблицы `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id_comment`),
  ADD KEY `fk_issue_comment` (`id_issue`);

--
-- Индексы таблицы `issues`
--
ALTER TABLE `issues`
  ADD PRIMARY KEY (`id_issue`),
  ADD KEY `id_client` (`id_client`),
  ADD KEY `fk_issues_status` (`id_status`),
  ADD KEY `fk_issues_marks` (`id_mark`),
  ADD KEY `fk_user_issue` (`id_user`);

--
-- Индексы таблицы `marks`
--
ALTER TABLE `marks`
  ADD PRIMARY KEY (`id_mark`);

--
-- Индексы таблицы `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id_messages`),
  ADD KEY `contact_id` (`contact_id`),
  ADD KEY `sender_id` (`sender_id`);

--
-- Индексы таблицы `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id_status`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `clients`
--
ALTER TABLE `clients`
  MODIFY `id_client` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `comments`
--
ALTER TABLE `comments`
  MODIFY `id_comment` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `issues`
--
ALTER TABLE `issues`
  MODIFY `id_issue` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT для таблицы `marks`
--
ALTER TABLE `marks`
  MODIFY `id_mark` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `messages`
--
ALTER TABLE `messages`
  MODIFY `id_messages` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `status`
--
ALTER TABLE `status`
  MODIFY `id_status` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `fk_issue_comment` FOREIGN KEY (`id_issue`) REFERENCES `issues` (`id_issue`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `issues`
--
ALTER TABLE `issues`
  ADD CONSTRAINT `fk_issues_marks` FOREIGN KEY (`id_mark`) REFERENCES `marks` (`id_mark`),
  ADD CONSTRAINT `fk_issues_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id_status`),
  ADD CONSTRAINT `fk_user_issue` FOREIGN KEY (`id_user`) REFERENCES `users` (`ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `issues_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id_client`);

--
-- Ограничения внешнего ключа таблицы `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`contact_id`) REFERENCES `clients` (`id_client`),
  ADD CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`sender_id`) REFERENCES `users` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
