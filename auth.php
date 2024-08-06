<?php
session_start();
include 'config.php'; // Ensure this file initializes $conn

// User Registration
if (isset($_POST['signup'])) {
    $username = $_POST['username'];
    $password = $_POST['password'];

    // Hash the password
    $password_hash = password_hash($password, PASSWORD_BCRYPT);

    // Prepare and bind
    $stmt = $conn->prepare("INSERT INTO users (username, password_hash) VALUES (?, ?)");
    $stmt->bind_param("ss", $username, $password_hash);

    // Execute and check for success
    if ($stmt->execute()) {
        echo "New user created successfully";
    } else {
        echo "Error: " . $stmt->error;
    }

    $stmt->close();
}

// User Login
if (isset($_POST['login'])) {
    $username = $_POST['username'];
    $password = $_POST['password'];

    // Prepare and bind
    $stmt = $conn->prepare("SELECT id, password_hash FROM users WHERE username = ?");
    $stmt->bind_param("s", $username);
    $stmt->execute();
    $stmt->store_result();

    if ($stmt->num_rows > 0) {
        $stmt->bind_result($user_id, $password_hash);
        $stmt->fetch();

        // Verify password
        if (password_verify($password, $password_hash)) {
            $_SESSION['user_id'] = $user_id;
            header('Location: index.php');
            exit();
        } else {
            echo "Invalid password";
        }
    } else {
        echo "No user found";
    }

    $stmt->close();
}

$conn->close();
?>
