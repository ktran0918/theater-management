<?php
	include "./movies-header.php";
	$title = "Production Companies' Popularity";
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
				SELECT name, COUNT(produce.movie_ID) as 'no of movies produced', AVG(rating) as 'avg rating', SUM(number_of_tickets_sold) as 'tickets sold'
				FROM production_company, produce, movies, has_movies
				WHERE production_company.company_ID=produce.company_ID AND movies.movie_ID=produce.movie_ID AND movies.movie_ID=has_movies.movie_ID
				GROUP BY name
				ORDER BY SUM(number_of_tickets_sold) DESC
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
				echo "<th>Name</th>";
				echo "<th>No. of Produced Movies</th>";
				echo "<th>Avg. Rating</th>";
				echo "<th>Tickets sold</th>";
				echo "</tr>";
				echo "</thead>";

				// Create the table body
				echo "<tbody>";
				// Extract rows from the results returned from the database
				while($row = mysqli_fetch_array($result)){
					echo "<tr>";
					echo "<td>" . $row['name'] . "</td>";
					echo "<td>" . $row['no of movies produced'] . "</td>";
					echo "<td>" . $row['avg rating'] . "</td>";
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
