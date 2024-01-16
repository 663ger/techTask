<?php
// Путь к файлу с админской страницей
$adminPagePath = "pages/admin.html";

// Ключ длиной 256 символов
$adminKey = "ed2f1a7b93c4d8e7a6b1d5f2c8e3d4b9a7c8e2d3b4a9c6d5f2c8e3d4b9a7c8e2d3b4a9c6d5f2c8e3d4b9a7c8e2d3b4a9c6d5f2c8e3d4b9a7c8e2d3b4a9c6d5f2c8e3d4b9a7c8e2d3b4a9c6d5f2c8e3d4b9a7c8e2d3b484359345934958349583498593485934853948593485934859gjdfgd;kfjgd;fkjg34534645645645644";

// Получаем параметр key из URL
$keyFromURL = isset($_GET['key']) ? $_GET['key'] : '';

// Проверяем, соответствует ли ключ ожидаемому ключу и имеет ли длину 256 или более символов
if ($keyFromURL === $adminKey && strlen($keyFromURL) >= 256) {
    // Перенаправляем на страницу admin.html
    $redirect_url = "pages/admin.html";
    header("Location: $redirect_url");
    exit();
} else {
    echo "Ошибка доступа: Неверный ключ!";
}
?>