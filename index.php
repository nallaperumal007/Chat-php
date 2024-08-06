<?php
session_start();
?>

<!DOCTYPE html>
<html>
<head>
    <title>Social App</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <div class="container">
        <?php if (!isset($_SESSION['user_id'])): ?>
        <div class="auth">
            <h2>Login</h2>
            <form action="auth.php" method="post">
                <input type="text" name="username" placeholder="Username" required>
                <input type="password" name="password" placeholder="Password" required>
                <button type="submit" name="login">Login</button>
            </form>

            <h2>Sign Up</h2>
            <form action="auth.php" method="post">
                <input type="text" name="username" placeholder="Username" required>
                <input type="password" name="password" placeholder="Password" required>
                <button type="submit" name="signup">Sign Up</button>
            </form>
        </div>
        <?php else: ?>
        <div class="auth">
            <h2>Change Password</h2>
            <form action="changepassword.php" method="post">
                <input type="password" name="current_password" placeholder="Current Password" required>
                <input type="password" name="new_password" placeholder="New Password" required>
                <input type="password" name="confirm_password" placeholder="Confirm New Password" required>
                <button type="submit" name="change_password">Change Password</button>
            </form>
        </div>

        <div class="posts">
            <h2>Create Post</h2>
            <form action="posts.php" method="post">
                <textarea name="content" placeholder="What's on your mind?" required></textarea>
                <label for="is_public">Public</label>
                <input type="checkbox" name="is_public" id="is_public">
                <button type="submit" name="create_post">Post</button>
            </form>

<div>
<?php if (isset($_SESSION['user_id'])): ?>
    <a href="private.php">Private Messages</a>
<?php endif; ?>
</div>


            <h2>All Posts</h2>
            <?php include 'posts.php'; ?>
            <?php foreach ($posts as $post): ?>
                <div class="post">
                    <div class="username"><?php echo $post['username']; ?></div>
                    <div class="content"><?php echo $post['content']; ?></div>
                    <div class="timestamp"><?php echo $post['created_at']; ?></div>
                </div>
            <?php endforeach; ?>
        </div>
        <?php endif; ?>
        <?php if (isset($_SESSION['user_id'])): ?>
        <form action="logout.php" method="post">
            <button type="submit" name="logout">Logout</button>
        </form>
        <?php endif; ?>
    </div>
    <script src="scripts.js"></script>
</body>
</html>
