<?php
	include "./movies-header.php";
	$title = "Movies Shown at Theaters";
?>

	<section class="greeting">
		<h1><?php echo $title; ?></h1>
	</section>

	<section class="main-content">
		<?php
			$conn = mysqli_connect(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME);
			if (!$conn) {
				die('Could not connect: ' . mysql_error());
			}
		// query to select all information from parts table
		//  ADD the SQL query *******
			$query = "SELECT Theater, Movie, tickets_sold FROM movies_at_theaters";
		// Get results from query
			$result = mysqli_query($conn, $query);
			if (!$result) {
				die("Query to show fields from table failed");
			}
			// If there are parts in the database construct an HTML table
			// to display the results
			if(mysqli_num_rows($result) > 0){
				//echo "<h1>Theatre</h1>";
				echo "<table class='data-table'>";
				// Create the table header
				echo "<thead>";
				echo "<tr>";
				echo "<th>Theater</th>";
				echo "<th>Movie</th>";
				echo "<th>Tickets Sold</th>";
				echo "</tr>";
				echo "</thead>";

				// Create the table body
				echo "<tbody>";
				// Extract rows from the results returned from the database
				while($row = mysqli_fetch_array($result)){
					echo "<tr>";
					echo "<td>" . $row['Theater'] . "</td>";
					echo "<td>" . $row['Movie'] . "</td>";
					echo "<td>" . $row['tickets_sold'] . "</td>";
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
	</section>

</main>

<?php include "../footer.php"; ?>
