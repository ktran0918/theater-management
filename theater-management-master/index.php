<!DOCTYPE html>
<?php 
  include "header.php"; 
  include 'connectvars.php';
  $title = "Welcome to Theater Management";
?>

<main>
  <section class="greeting">
    <h1><?php echo $title; ?></h1>
    <p>To begin, click on an item you want to manage in the top menu.</p>
  </section>
</main>

<body>
	<?php

	$conn = mysqli_connect(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME);
	if (!$conn) {
		die('Could not connect: ' . mysql_error());
	}

// query to select all information from parts table
//  ADD the SQL query *******
	$query = "SELECT * FROM theatre ";

// Get results from query
	$result = mysqli_query($conn, $query);
	if (!$result) {
		die("Query to show fields from table failed");
	}
	// If there are parts in the database construct an HTML table
	// to display the results

	if(mysqli_num_rows($result) > 0){
        echo "<h1>Theatre</h1>";
		echo "<table id='t01' border='1'>";
		// Create the table header
        echo "<thead>";
			echo "<tr>";
			echo "<th>ID</th>";
			echo "<th>Name</th>";
			echo "<th>Phone_number</th>";
			echo "<th>Street</th>";
			echo "<th>City</th>";
			echo "<th>State</th>";
			echo "</tr>";
        echo "</thead>";
        echo "<tbody>";

		// Extract rows from the results returned from the database
        while($row = mysqli_fetch_array($result)){
        //  ADD code to display the parts  *****
		//  This is similar to how suppliers were displayed  ***
						echo "<tr>";
						echo "<td>" . $row['theater_ID'] . "</td>";
						echo "<td>" . $row['name'] . "</td>";
						echo "<td>" . $row['phone_number'] . "</td>";
						echo "<td>" . $row['street'] . "</td>";
						echo "<td>" . $row['city'] . "</td>";
						echo "<td>" . $row['state'] . "</td>";
						echo "</tr>";

        }
        echo "</tbody>";
        echo "</table>";
		// Free result set
        mysqli_free_result($result);
    } else{
		echo "<p class='lead'><em>No records were found.</em></p>";
    }
	// Close the database connection
	mysqli_close($conn);
	?>
</body>

<?php include "footer.php"; ?>