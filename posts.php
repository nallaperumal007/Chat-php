<?php
// Start session if not already started
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}
?>
<?php

include 'config.php';

if (isset($_POST['create_post'])) {
    $user_id = $_SESSION['user_id'];
    $content = $_POST['content'];
    $is_public = isset($_POST['is_public']) ? 1 : 0;

    $sql = "INSERT INTO posts (user_id, content, is_public) VALUES ('$user_id', '$content', '$is_public')";
    if ($conn->query($sql) === TRUE) {
        echo "Post created successfully";
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
}

// Fetch Posts
$sql = "SELECT p.*, u.username FROM posts p JOIN users u ON p.user_id=u.id WHERE p.is_public=1";
$result = $conn->query($sql);

$posts = [];
while ($row = $result->fetch_assoc()) {
    $posts[] = $row;
}
?>