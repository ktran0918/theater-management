<?php 
  include "../header.php"; 
  $title = "Manage Movies";
?>

<nav id="side-nav">
  <ul id="side-nav-list">
    <li><a href="index.php">List</a></li>
    <li><a href="genres-by-season.php">Genres by Seasons</a></li>
    <li><a href="production-companies-popularity.php">Production Companies' Popularity</a></li>
    <li><a href="actors-statistics.php">Actors' Statistics</a></li>
  </ul>
</nav>

<main>
  <section class="greeting">
    <h1><?php echo $title; ?></h1>
  </section>
</main>

<?php include "../footer.php"; ?>