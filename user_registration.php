<?php
session_start();
include 'db_connect.php';

// Check if the user is logged in and is an authorized user
// if (!isset($_SESSION['user_id']) || $_SESSION['role'] != 'authorized') {
//     header('Location: login.php');
//     exit;
// }

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $username = $_POST['username'];
    $password = password_hash($_POST['password'], PASSWORD_DEFAULT);
    $role = $_POST['role'];

    $sql = "INSERT INTO users (username, password, role) VALUES ('$username', '$password', '$role')";
    
    if ($conn->query($sql) === TRUE) {
        header('Location: user_registration.php');
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Register User</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <h2>Register User</h2>
    <form method="POST" action="user_registration.php">
        <label>Username:</label>
        <input type="text" name="username" required><br>
        <label>Password:</label>
        <input type="password" name="password" required><br>
        <label>Role:</label>
        <select name="role" required>
            <option value="admin">Admin</option>
            <option value="normal">Normal</option>
        </select><br>
        <button type="submit">Register</button>
    </form>
</body>
</html>
