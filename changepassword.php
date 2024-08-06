<?php
session_start();
require 'config.php'; // Ensure this file initializes $conn

if (!isset($_SESSION['user_id'])) {
    header('Location: index.php');
    exit();
}

if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['change_password'])) {
    $user_id = $_SESSION['user_id'];
    $current_password = $_POST['current_password'];
    $new_password = $_POST['new_password'];
    $confirm_password = $_POST['confirm_password'];

    // Validate input
    if ($new_password !== $confirm_password) {
        die("New passwords do not match.");
    }

    // Fetch the current hashed password from the database
    $query = "SELECT password_hash FROM users WHERE id = ?";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("i", $user_id);
    $stmt->execute();
    $result = $stmt->get_result();
    $user = $result->fetch_assoc();

    if (!$user || !password_verify($current_password, $user['password_hash'])) {
        die("Current password is incorrect.");
    }

    // Fetch the last three hashed passwords from the password history
    $query = "SELECT password_hash FROM password_history WHERE user_id = ? ORDER BY created_at DESC LIMIT 3";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("i", $user_id);
    $stmt->execute();
    $result = $stmt->get_result();
    $previous_passwords = $result->fetch_all(MYSQLI_ASSOC);

    // Check if the new password matches any of the last three passwords
    foreach ($previous_passwords as $password_entry) {
        if (password_verify($new_password, $password_entry['password_hash'])) {
            die("New password must not be the same as any of the last three passwords.");
        }
    }

    // Hash the new password
    $new_password_hash = password_hash($new_password, PASSWORD_DEFAULT);

    // Update the password in the users table
    $query = "UPDATE users SET password_hash = ? WHERE id = ?";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("si", $new_password_hash, $user_id);
    $stmt->execute();

    // Insert the new password into the password history
    $query = "INSERT INTO password_history (user_id, password_hash, created_at) VALUES (?, ?, NOW())";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("is", $user_id, $new_password_hash);
    $stmt->execute();

    // Remove the oldest password from history if there are more than 3 entries
    $query = "
        DELETE FROM password_history 
        WHERE user_id = ? 
        AND id NOT IN (
            SELECT id 
            FROM (
                SELECT id 
                FROM password_history 
                WHERE user_id = ? 
                ORDER BY created_at DESC 
                LIMIT 3
            ) AS temp
        )
    ";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("ii", $user_id, $user_id);
    $stmt->execute();

    echo "Password changed successfully.";
}
?>
