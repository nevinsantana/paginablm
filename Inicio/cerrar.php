<?php
session_start();
if(!isset($_SESSION['usuario'])){
header("location:../iluminacion/index.php");
} else {
session_unset();
session_destroy();
header("location:../iluminacion/index.php");
}
?>
