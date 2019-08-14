<?php
  include "./movies-header.php";
  $title="Delete a Movie";
?>

<section class = "greeting">
  <h1><?php echo $title; ?></h1>
</section>

<?php
  $msg = "Delete a record for a movie:";
  $conn = mysqli_connect(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME);
  
  if(!$conn){
    die('Could not connect: ' . mysql_error());
  }

  if($_SERVER["REQUEST_METHOD"] == "POST"){
    $movie_ID = mysqli_real_escape_string($conn, $_POST['movie_ID']);
    //Add query to insert movie in movies table
    $queryIn = "SELECT * FROM movies where movie_ID = '$movie_ID'";
    $resultIn = mysqli_query($conn, $queryIn);
    if(mysqli_num_rows($resultIn) == 0){
      $msg = "Must be an existing ID!";
    }
    else {
      $query = "
        DELETE FROM movies
        WHERE movie_ID = $movie_ID
      ";
      
      if(mysqli_query($conn, $query)){
        $msg = "Movie is deleted successfully.<p>";
      }
      else {
        echo "ERROR: could not delete the movie $query." . mysqli_error($conn);
      }
    }
  }
  mysqli_close($conn);
?>

<section id="main-content">
  <h2><?php echo $msg; ?></h2>
  <form method="post" id="deleteForm">
    <fieldset>
      <legend>Movie:</legend>
      <p> 
        <label for "movie_ID">Movie ID: </label>
        <input type = "number" min = 0 max = 999999999 required name = "movie_ID" id = "movie_ID" title= "movie_ID should be numberic">
      </p>
      <p>
        <input type = "submit" value = "submit"/>
        <input type = "reset" value = "clear form"/>
      </p>

    </fieldset>
  </form>

</section>

</main>

<?php include "../footer.php"; ?>