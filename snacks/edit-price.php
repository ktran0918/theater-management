<?php
  include "./snacks-header.php";
  $title="Edit Price";
?>

<section class = "greeting">
  <h1><?php echo $title; ?></h1>
</section>

<?php
  $msg = "Edit a snack's price:";
  $conn = mysqli_connect(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME);
  
  if(!$conn){
    die('Could not connect: ' . mysql_error());
  }

  if($_SERVER["REQUEST_METHOD"] == "POST"){
    $snack_ID = mysqli_real_escape_string($conn, $_POST['snack_ID']);
    $price = mysqli_real_escape_string($conn, $_POST['price']);
    $queryIn = "SELECT price FROM snack where snack_ID = '$snack_ID'";
    $resultIn = mysqli_query($conn, $queryIn);
    if(mysqli_num_rows($resultIn) == 0){
      $msg = "Must be an existing ID!";
    }
    else {
      $query = "
        UPDATE snack
        SET price = '$price'
        WHERE snack_ID = $snack_ID
      ";
      
      if(mysqli_query($conn, $query)){
        $msg = "Snack's price edited successfully.<p>";
      }
      else {
        echo "ERROR: could not edit the snack $query." . mysqli_error($conn);
      }
    }
  }
  mysqli_close($conn);
?>

<section id="main-content">
  <h2><?php echo $msg; ?></h2>
  <form method="post" id="editForm">
    <fieldset>
      <legend>Snack:</legend>
      <p> 
        <label for "snack_ID">Snack ID: </label>
        <input type = "number" min = 0 max = 999999999 required name = "snack_ID" id = "snack_ID" title= "Snack ID should be numberic">
      </p>
      <p>
        <label for "price">Price:</label>
        <input type = "number" min = 0 max = 99 required name = "price" id = "price" step=".01" title = "price should be numeric">
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