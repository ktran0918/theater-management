<?php
    include "./snacks-header.php";
    $title="Add a Snack";
?>
    <section class = "greeting">
	<h1><?php echo $title; ?></h1>
    </section>

<?php
    $msg = "Add a new snack record:";
    $conn = mysqli_connect(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME);
    if(!$conn){
	die('Could not connect: ' . mysql_error());
    }
    if($_SERVER["REQUEST_METHOD"] == "POST"){
    $snack_ID = mysqli_real_escape_string($conn, $_POST['snack_ID']);
 	$snack_name = mysqli_real_escape_string($conn, $_POST['snack_name']);
 	$price = mysqli_real_escape_string($conn, $_POST['price']);
 	$type = mysqli_real_escape_string($conn, $_POST['type']);
	$quantity_sold = mysqli_real_escape_string($conn, $_POST['quantity_sold']);
	

	//Add query to insert snack in snacks table
	$queryIn = "SELECT * FROM snack where snack_ID = '$snack_ID'";
        $resultIn = mysqli_query($conn, $queryIn);
        if(mysqli_num_rows($resultIn) > 0){
	    $msg = "<h2>Can't Add to Table</h2> There is already a snack with snack_ID $snack_ID<p>";
	}
	else{
	    $query = "INSERT INTO snack(snack_ID, snack_name, price, type, quantity_sold) VALUES('$snack_ID', '$snack_name', '$price', '$type', '$quantity_sold')";
    	    if(mysqli_query($conn, $query)){
		$msg = "snack added successfully.<p>";
	    }
	    else{
		echo "ERROR: could not insert the snack $query." . mysqli_error($conn);
	    }
	}
}

mysqli_close($conn);
?>
    <h2> <?php echo $msg; ?> </h2>
    <form method="post" id="addForm">
    <fieldset>
	<legend>snack:</legend>
	<p> 
	    <label for "snack_ID">snack ID: </label>
	    <input type = "number" min = 0 max = 999999999 class="required" name = "snack_ID" id = "snack_ID" title= "movie_ID should be numeric">
	</p>
	<p>
	    <label for "snack_name">name:</label>
	    <input type = "text" class = "required" name = "snack_name" id = "snack_name">
	</p>
	<p>
	    <label for "price">price:</label>
	    <input type = "number" min = 0 max = 99 class = "required" name = "price" id = "price" step=".01" title = "price should be numeric">
	</p>
	<p>
	    <label for "type">type:</label>
	    <input type = "text" class = "required" name = "type" id = "type">
	</p>	
	<p>
	    <label for "quantity_sold">quantity_sold:</label>
	    <input type = "number" min = 0 max = 99999 class = "required" name = "quantity_sold" id = "quantity_sold" title = "quantity sold should be numeric">
	</p>

	<p>
	    <input type = "submit" value = "submit"/>
	    <input type = "reset" value = "clear form"/>
    </fieldset>
</body>
</html>
 
