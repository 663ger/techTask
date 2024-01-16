<?php
// Проверка ключа в URL
if (!isset($_GET['admin_key']) || strlen($_GET['admin_key']) < 256 || $_GET['admin_key'] !== 'ed2f1a7b93c4d8e7a6b1d5f2c8e3d4b9a7c8e2d3b4a9c6d5f2c8e3d4b9a7c8e2d3b4a9c6d5f2c8e3d4b9a7c8e2d3b4a9c6d5f2c8e3d4b9a7c8e2d3b4a9c6d5f2c8e3d4b9a7c8e2d3b4a9c6d5f2c8e3d4b9a7c8e2d3b484359345934958349583498593485934853948593485934859gjdfgd;kfjgd;fkjg34534645645645644') {
    echo "Доступ запрещен!";
    exit();
}

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "my_database";

try {
    $conn = new mysqli($servername, $username, $password, $dbname);

    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $login = $_POST["login"];
        $password = $_POST["password"];
        $confirm_password = $_POST["confirm_password"];

        // Проверка пароля и его подтверждения
        if ($password != $confirm_password) {
            echo "Пароли не совпадают";
        } else {
            // Проверка наличия пользователя с таким логином
            $check_user_sql = "SELECT * FROM Users WHERE login = '$login'";
            $result = $conn->query($check_user_sql);

            if ($result->num_rows > 0) {
                // Генерация нового пароля
                $new_password = rand(10000, 99999);

                // Хеширование нового пароля
                $hashed_password = password_hash($new_password, PASSWORD_DEFAULT);

                // Обновление пароля пользователя в базе данных
                $update_password_sql = "UPDATE Users SET password = '$hashed_password' WHERE login = '$login'";

                if ($conn->query($update_password_sql) === TRUE) {
                    echo "Пароль пользователя успешно изменен. Новый пароль: $new_password";
                } else {
                    echo "Ошибка при изменении пароля пользователя: " . $conn->error;
                }
            } else {
               
                $hashed_password = password_hash($password, PASSWORD_DEFAULT);

                // Добавление пользователя в базу данных
                $insert_user_sql = "INSERT INTO Users (login, password) VALUES ('$login', '$hashed_password')";

                if ($conn->query($insert_user_sql) === TRUE) {
                    echo "Пользователь успешно добавлен";
                } else {
                    echo "Ошибка при добавлении пользователя: " . $conn->error;
                }
            }
        }
    }
} finally {
    if (isset($conn)) {
        $conn->close();
    }
}
?>

<!DOCTYPE html>
<html lang="en" dir="ltr">
   <head>
      <meta charset="utf-8">
      <link rel="stylesheet" href="CSS/style.css">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
   </head>
   <body>
      <div class="content">
         <div class="text">
            Добавление нового пользователя
         </div>
         <form action="admin.php?admin_key=ed2f1a7b93c4d8e7a6b1d5f2c8e3d4b9a7c8e2d3b4a9c6d5f2c8e3d4b9a7c8e2d3b4a9c6d5f2c8e3d4b9a7c8e2d3b4a9c6d5f2c8e3d4b9a7c8e2d3b4a9c6d5f2c8e3d4b9a7c8e2d3b4a9c6d5f2c8e3d4b9a7c8e2d3b484359345934958349583498593485934853948593485934859gjdfgd;kfjgd;fkjg34534645645645644" method="post">
    <div class="field">
        <input type="text" name="login" required>
        <span class="fas fa-user"></span>
        <label>Логин</label>
    </div>
    <div class="field">
        <input type="password" name="password" required>
        <span class="fas fa-lock"></span>
        <label>Пароль</label>
    </div>
    <div class="field">
        <input type="password" name="confirm_password" required>
        <span class="fas fa-lock"></span>
        <label>Повторите пароль</label>
    </div>
    <button type="submit" class="enter">Добавить пользователя</button>
</form>
      </div>
   </body>
   <script src="JS/script.js"></script>
</html>