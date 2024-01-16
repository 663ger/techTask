<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "my_database";

$conn = new mysqli($servername, $username, $password, $dbname);

// Получение данных из AJAX-запроса
$userId = $_POST['userId'];

// Запрос к базе данных для удаления пользователя
$deleteUserSql = "DELETE FROM users WHERE ID = $userId";

if ($conn->query($deleteUserSql) === TRUE) {
    echo "success";
} else {
    echo "Ошибка при удалении пользователя: " . $conn->error;
}

$conn->close();
?>
