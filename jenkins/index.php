<?php
session_start();
if (!isset($_SESSION['username'])) {
    header("Location: login.php");
    exit();
}
?>
<?php include("header.php"); ?>

<!-- form content -->

<?php include("footer.php"); ?>

<form action="save_data.php" method="post">
  Name: <input type="text" name="name"><br>
  Surname: <input type="text" name="surname"><br>
  Grade: <input type="text" name="grade"><br>
  Monthly Fee: <input type="number" name="fee"><br>
  Pay: <input type="checkbox" name="pay" value="1"><br>
  Parent: <input type="text" name="parent"><br>
  <input type="submit" value="Save / Update">
  
</form>