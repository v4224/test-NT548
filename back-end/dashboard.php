<?php
session_start();

if (!isset($_SESSION['username'])) {
    header("Location: login.php");
    exit();
}

echo "Hello, " . $_SESSION['username'] . "!<br>";
echo "Hello World!";
?>