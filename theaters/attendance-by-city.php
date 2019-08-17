<?php
	include "./theater-header.php";
	$title = "Attendance by City";
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
			$query = "
				SELECT city, COUNT(has_movies.theater_ID) as 'number of attended theaters', SUM(has_movies.number_of_tickets_sold) AS 'tickets sold'
				FROM theatre, has_movies, movies
				WHERE theatre.theater_ID=has_movies.theater_ID AND has_movies.movie_ID=movies.movie_ID
				GROUP BY city
				ORDER BY SUM(has_movies.number_of_tickets_sold) DESC
			";
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
				echo "<th>City</th>";
				echo "<th>No. of Attended Theaters</th>";
				echo "<th>Tickets Sold</th>";
				echo "</tr>";
				echo "</thead>";

				// Create the table body
				echo "<tbody>";
				// Extract rows from the results returned from the database
				while($row = mysqli_fetch_array($result)){
					echo "<tr>";
					echo "<td>" . $row['city'] . "</td>";
					echo "<td>" . $row['number of attended theaters'] . "</td>";
					echo "<td>" . $row['tickets sold'] . "</td>";
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