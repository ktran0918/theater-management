<?php
    include "./movies-header.php";
    $title="Delete Movies";
?>
    <section class = "greeting">
	<h1><?php echo $title; ?></h1>
    </section>

<?php
    $msg = "Delete movie record from the movie table";
    $conn = mysqli_connect(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME);
    if(!$conn){
	die('Could not connect: ' . mysql_error());
    }
    if($_SERVER["REQUEST_METHOD"] == "POST"){
        $movie_ID = mysqli_real_escape_string($conn, $_POST['movie_ID']);
 	    $movie_name = mysqli_real_escape_string($conn, $_POST['movie_name']);
	    $release_date = mysqli_real_escape_string($conn, $_POST['release_date']);
	    $running_time = mysqli_real_escape_string($conn, $_POST['running_time']);
	    $genre = mysqli_real_escape_string($conn, $_POST['genre']);
	    $rating = mysqli_real_escape_string($conn, $_POST['rating']);
	    $number_of_tickets_sold = mysqli_real_escape_string($conn, $_POST['number_of_tickets_sold']);
	    $price = mysqli_real_escape_string($conn, $_POST['price']);

	//Add query to insert movie in movies table
	    $queryIn = "DELETE FROM movies where movie_ID = '$_GET[movie_ID]'";
        $resultIn = mysqli_query($conn, $queryIn);
        if(mysqli_num_rows($resultIn) = 0){
	    $msg = "<h2>Can't delete the Table</h2> movie_ID $movie_ID does not exist<p>";
	}
	else{
	    $query = "DELETE FROM movies WHERE movie_ID = '$movie_ID' AND movie_name = '$movie_name' AND release_date = '$release_date' AND running_time = '$running_time' AND genre = '$genre' AND rating = '$rating' AND number_of_tickets_sold = '$number_of_tickets_sold' AND price = '$price';
		$msg = "Movies added successfully.<p>";
	    }
	    else{
		echo "ERROR: could not insert the movie $query." . mysqli_error($conn);
	    }
	}
}

mysqli_close($conn);
?>
    <h2> <?php echo $msg; ?> </h2>
    <form method="post" id="addForm">
    <fieldset>
	<legend>Movies:</legend>
	<p>
	    <label for "movie_ID">Movie ID: </label>
	    <input type = "number" min = 0 max = 999999999999 class="required" name = "movie_ID" id = "movie_ID" title= "moive_ID should be numberic">
	</p>
	<p>
	    <label for "movie_name">name:</label>
	    <input type = "text" class = "required" name = "movie_name" id = "movie_name">
	</p>
	<p>
	    <label for "release_date">release_date:</label>
	    <input type = "text" class = "required" name = "release_date" id = "release_date">
        </p>
        <p>
            <label for "running_time">running_time:</label>
	    <input type = "number" min = 1 max = 99999 class = "required" name = "running_time" id = "running_time" title = "running_time should be numberic">
        </p>
	<p>
    	    <label for "genre">genre:</label>
	    <input type = "text" class = "required" name = "genre" id = genre">
    	</p>
	<p>
	    <label for "rating">rating:</label>
	    <input type = "number" min = 0 max = 10 class = "required" name = "rating" id = "rating" title = "rating should be numeric">
	</p>
	<p>
	    <label for "number_of_tickets_sold">number_of_ticket_sold:</label>
	    <input type = "number" min = 0 max = 99999 class = "required" name = "number_of_tickets_sold" id = "number_of_tickets_sold" title = "number of tickets sold should be numeric">
	</p>
	<p>
	    <label for "price">price:</label>
	    <input type = "number" min = 0 max = 99999 class = "required" name = "price" id = "price" title = "price should be numeric">
	</p>
	<p>
	    <input type = "submit" value = "submit"/>
	    <input type = "reset" value = "clear form"/>
    </fieldset>
</body>
</html>
