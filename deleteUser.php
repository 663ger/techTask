<?php
include 'database.php';

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
