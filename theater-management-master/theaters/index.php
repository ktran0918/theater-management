<?php 
  include "../header.php"; 
  $title = "Manage Theaters";
?>

<nav id="side-nav">
  <ul id="side-nav-list">
    <li><a href="index.php">List</a></li>
    <li><a href="attendance-by-theater.php">Attendance by Theater</a></li>
    <li><a href="attendance-by-city.php">Attendance by City</a></li>
  </ul>
</nav>

<main>
  <section class="greeting">
    <h1><?php echo $title; ?></h1>
  </section>
</main>

<?php include "../footer.php"; ?>