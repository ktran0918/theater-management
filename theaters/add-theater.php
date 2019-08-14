<?php
    include "./theater-header.php";
    $title="Add a Theater";
?>
    <section class = "greeting">
	<h1><?php echo $title; ?></h1>
    </section>

<?php
    $msg = "Add a new theater record:";
    $conn = mysqli_connect(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME);
    if(!$conn){
	die('Could not connect: ' . mysql_error());
    }
    if($_SERVER["REQUEST_METHOD"] == "POST"){
    $theater_ID = mysqli_real_escape_string($conn, $_POST['theater_ID']);
 	$name = mysqli_real_escape_string($conn, $_POST['name']);
	$phone_number = mysqli_real_escape_string($conn, $_POST['phone_number']);
	$street = mysqli_real_escape_string($conn, $_POST['street']);
	$city = mysqli_real_escape_string($conn, $_POST['city']);
	$state = mysqli_real_escape_string($conn, $_POST['state']);

	//Add query to insert theater in theaters table
	$queryIn = "SELECT * FROM theatre where theater_ID = '$theater_ID'";
        $resultIn = mysqli_query($conn, $queryIn);
        if(mysqli_num_rows($resultIn) > 0){
	    $msg = "<h2>Can't Add to Table</h2> There is already a theater with theater_ID $theater_ID<p>";
	}
	else{
	    $query = "INSERT INTO theatre(theater_ID, name, phone_number, street, city, state) VALUES('$theater_ID', '$name', '$phone_number', '$street', '$city', '$state')";
    	    if(mysqli_query($conn, $query)){
		$msg = "theaters added successfully.<p>";
	    }
	    else{
		echo "ERROR: could not insert the theater $query." . mysqli_error($conn);
	    }
	}
}

mysqli_close($conn);
?>
    <h2> <?php echo $msg; ?> </h2>
    <form method="post" id="addForm">
    <fieldset>
	<legend>Theater:</legend>
	<p> 
	    <label for "theater_ID">Theater ID: </label>
	    <input type = "number" min = 0 max = 999999999 class="required" name = "theater_ID" id = "theater_ID" title= "theater_ID should be numberic">
	</p>
	<p>
	    <label for "name">name:</label>
	    <input type = "text" class = "required" name = "name" id = "name">
	</p>
	 <p>
         <label for "phone_number">phone_number:</label>
	    <input type = "number" min = 1 max = 9999999999 class = "required" name = "phone_number" id = "phone_number" title = "phone_number should be numberic">
     </p>
        <p>
    	<label for "street">street:</label>
	    <input type = "text" class = "required" name = "street" id = "street">
    	</p>
	<p>
    	<label for "city">city:</label>
	    <input type = "text" class = "required" name = "city" id = "city">
    	</p>
	<p>
    	<label for "state">state:</label>
	    <input type = "text" class = "required" name = "state" id = "state">
    	</p>
	<p>
	    <input type = "submit" value = "submit"/>
	    <input type = "reset" value = "clear form"/>
    </fieldset>
</form>

</section>

</main>

<?php include "../footer.php"; ?>
 
