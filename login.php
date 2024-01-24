<?php
include 'database.php';

try {
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $login = $_POST["login"];
        $password = $_POST["password"];

        // Поиск пользователя в базе данных
        $sql = "SELECT * FROM Users WHERE login = '$login'";
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();
            $hashed_password = $row['password'];

            if (password_verify($password, $hashed_password)) {
                // Пользователь найден, пароль верен
                $session_id = md5(uniqid(rand(), true));

                $cookie_expiration = isset($_POST['rememberme']) ? 86400 * 30 : 86400;

                setcookie("login", $login, time() + $cookie_expiration, "/");
                setcookie("SessionID", $session_id, time() + $cookie_expiration, "/");

                // Сохранение SessionID в базе данных
                $sql_update_session = "UPDATE Users SET session_id = '$session_id' WHERE login = '$login'";
                $conn->query($sql_update_session);
                
                // Перенаправление на страницу авторизованного пользователя
                $redirect_url = "pages/authorized.html";
                header("Location: $redirect_url");
                exit();
            } else {
                // Пользователь найден, но пароль неверен
                $response = array(
                    'Status' => 'Fail',
                    'Message' => 'Invalid login credentials'
                );
                echo json_encode($response);
                exit();
            }
        } else {
            // Пользователь не найден
            $response = array(
                'Status' => 'Fail',
                'Message' => 'Invalid login credentials'
            );
            echo json_encode($response);
            exit();
        }
    }
} finally {
    
    if (isset($conn)) {
        $conn->close();
    }
}
?>
