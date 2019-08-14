<?php
  include "./movies-header.php";
  $title="Edit Price";
?>

<section class = "greeting">
  <h1><?php echo $title; ?></h1>
</section>

<?php
  $msg = "Edit a movie's price:";
  $conn = mysqli_connect(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME);
  
  if(!$conn){
    die('Could not connect: ' . mysql_error());
  }

  if($_SERVER["REQUEST_METHOD"] == "POST"){
    $movie_ID = mysqli_real_escape_string($conn, $_POST['movie_ID']);
    $price = mysqli_real_escape_string($conn, $_POST['price']);
    //Add query to insert movie in movies table
    $queryIn = "SELECT price FROM movies where movie_ID = '$movie_ID'";
    $resultIn = mysqli_query($conn, $queryIn);
      $query = "
        UPDATE movies
        SET price = '$price'
        WHERE movie_ID = $movie_ID
      ";
      
      if(mysqli_query($conn, $query)){
        $msg = "Movie's price edited successfully.<p>";
      }
      else {
        echo "ERROR: could not edit the movie $query." . mysqli_error($conn);
      }
    }

  mysqli_close($conn);
?>

<section id="main-content">
  <h2><?php echo $msg; ?></h2>
  <form method="post" id="editForm">
    <fieldset>
      <legend>Movie:</legend>
      <p> 
        <label for "movie_ID">Movie ID: </label>
        <input type = "number" min = 0 max = 999999999 class="required" name = "movie_ID" id = "movie_ID" title= "movie_ID should be numberic">
      </p>
      <p>
        <label for "price">Price:</label>
        <input type = "number" min = 0 max = 99 class = "required" name = "price" id = "price" step=".01" title = "price should be numeric">
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