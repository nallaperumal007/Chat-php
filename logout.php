<?php
session_start();

// Unset all of the session variables
$_SESSION = array();

// Destroy the session
session_destroy();

// Redirect to login page or any desired page after logout
header("Location: index.php");
exit;
?>
