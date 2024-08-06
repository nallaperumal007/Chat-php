<?php
session_start();
require 'config.php'; // Ensure this file initializes $conn

// Ensure the user is logged in
if (!isset($_SESSION['user_id'])) {
    header('Location: index.php'); // Redirect to the main page if not logged in
    exit();
}

// Fetch all users
$query = "SELECT id, username FROM users WHERE id != ?";
$stmt = $conn->prepare($query);
$stmt->bind_param("i", $_SESSION['user_id']);
$stmt->execute();
$result = $stmt->get_result();
$users = $result->fetch_all(MYSQLI_ASSOC);

// Handle sending a message
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['recipient_id']) && isset($_POST['message_content'])) {
    $recipient_id = $_POST['recipient_id'];
    $message_content = $_POST['message_content'];
    
    // Insert the message into the database
    $query = "INSERT INTO private_messages (sender_id, recipient_id, message_content) VALUES (?, ?, ?)";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("iis", $_SESSION['user_id'], $recipient_id, $message_content);
    $stmt->execute();

    // Redirect to avoid resubmitting the form
    header('Location: private.php');
    exit();
}

// Fetch messages with a specific user if user_id is provided
$messages = [];
if (isset($_GET['user_id'])) {
    $user_id = $_GET['user_id'];

    $query = "SELECT * FROM private_messages WHERE (sender_id = ? AND recipient_id = ?) OR (sender_id = ? AND recipient_id = ?) ORDER BY created_at";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("iiii", $user_id, $_SESSION['user_id'], $_SESSION['user_id'], $user_id);
    $stmt->execute();
    $result = $stmt->get_result();
    $messages = $result->fetch_all(MYSQLI_ASSOC);
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Private Messages</title>
    <link rel="stylesheet" type="text/css" href="private.css">
</head>
<body>
    <div class="container">
        <div class="users">
            <h2>Users</h2>
            <ul>
                <?php foreach ($users as $user): ?>
                    <li>
                        <a href="private.php?user_id=<?php echo $user['id']; ?>">
                            <?php echo htmlspecialchars($user['username']); ?>
                        </a>
                    </li>
                <?php endforeach; ?>
            </ul>
        </div>

        <div class="messages">
            <?php if (isset($_GET['user_id'])): ?>
                <?php
                // Find the username of the selected user for display
                $selected_user_id = $_GET['user_id'];
                $query = "SELECT username FROM users WHERE id = ?";
                $stmt = $conn->prepare($query);
                $stmt->bind_param("i", $selected_user_id);
                $stmt->execute();
                $result = $stmt->get_result();
                $selected_user = $result->fetch_assoc();
                ?>
                <h2>Messages with <?php echo htmlspecialchars($selected_user['username']); ?></h2>
                <div class="message-list">
                    <?php foreach ($messages as $message): ?>
                        <div class="message <?php echo $message['sender_id'] == $_SESSION['user_id'] ? 'sent' : 'received'; ?>">
                            <div class="content"><?php echo htmlspecialchars($message['message_content']); ?></div>
                            <div class="timestamp"><?php echo $message['created_at']; ?></div>
                        </div>
                    <?php endforeach; ?>
                </div>
                <form action="private.php?user_id=<?php echo $_GET['user_id']; ?>" method="post">
                    <textarea name="message_content" placeholder="Type your message..." required></textarea>
                    <input type="hidden" name="recipient_id" value="<?php echo $_GET['user_id']; ?>">
                    <button type="submit">Send</button>
                </form>
            <?php else: ?>
                <p>Select a user to start a conversation.</p>
            <?php endif; ?>
        </div>
    </div>
    <script src="scripts.js"></script>

 <form action="logout.php" method="post">
            <button type="submit" name="logout">Logout</button>
        </form>
</body>
</html>
