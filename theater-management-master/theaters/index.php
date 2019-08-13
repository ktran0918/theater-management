<?php
  include "../header.php";
  include "../connectvars.php";
  $title = "Manage Theaters";
?>

<nav id="side-nav">
  <ul id="side-nav-list">
    <li><a href=" ">List</a ></li>
    <li><a href="attendance-by-theater.php">Attendance by Theater</a ></li>
    <li><a href="attendance-by-city.php">Attendance by City</a ></li>
  </ul>
</nav>

<?php
    //connect to the database
    $conn = mysql_connect(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME);
    if(!$conn){
        die('Could not connect: ' . mysql_error());
    }
    $query = "SELECT * FROM Theaters";
    $result = musqli_query($conn, $query);
    if(!$result){
           die("Query to show filelds from table failed");
    if(mysql_num_rows($result)>0){
    echo "<h1>Theaters</h1>";
            echo "<table id = 't01' border = '1'>";
    echo "<thead>";
                   echo "<tr>";
                   echo "<th>theater_ID</th>";
                   echo "<th>name</th>";
                   echo "<th>phone_number</th>";
                   echo "<th>Street</th>";
                   echo "<th>city</th>";
                   echo "<th>state</th>";
    echo"</thead>";
    echo "<tbody>";
?>

<main>
  <section class="greeting">
    <h1><?php echo $title; ?></h1>
  </section>
</main>

<?php include "../footer.php"; ?>
