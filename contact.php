<?php include 'includes/session.php'; ?>
<?php include 'includes/header.php'; ?>
<body class="hold-transition skin-blue layout-top-nav">
<div class="wrapper">

	<?php include 'includes/navbar.php'; ?>
	 
	  <div class="content-wrapper">
	    <div class="container">

	      <!-- Main content -->
	      <section class="content">
	        <div class="row">
	        	<div class="col-sm-9">
						<?php
							if(isset($_SESSION['message_success'])){
								echo "
								<div class=' callout callout-success text-center'>
									<p>".$_SESSION['message_success']."</p> 
								</div>
								";
								unset($_SESSION['message_success']);
							}
							if(isset($_SESSION['message_error'])){
								echo "
								<div class=' callout callout-danger text-center'>
									<p>".$_SESSION['message_error']."</p> 
								</div>
								";
								unset($_SESSION['message_error']);
							}
						?>
					<section class="mb-4">

						<!--Section heading-->
						<h2 class="h1-responsive font-weight-bold text-center my-4">Contact us</h2>
						<!--Section description-->
						<p class="text-center w-responsive mx-auto mb-5">Please do not hesitate to contact us directly. Our team will come back to you within
							a matter of hours to help you.</p>

						<div class="row">

							<!--Grid column-->
							<div class="col-md-11">
								<form id="contact-form" name="contact-form" action="contact-message.php" method="POST">

									<!--Grid row-->
									<div class="row">

										<!--Grid column-->
										<div class="col-md-6">
											<div class="md-form mb-0">
												<input required  type="text" id="name" name="name" class="form-control">
												<label for="name" class="">Your name</label>
											</div>
										</div>
										<!--Grid column-->

										<!--Grid column-->
										<div class="col-md-6">
											<div class="md-form mb-0">
												<input required type="text" id="email" name="email" class="form-control">
												<label for="email" class="">Your email</label>
											</div>
										</div>
										<!--Grid column-->

									</div>
									<!--Grid row-->

									<!--Grid row-->
									<div class="row">
										<div class="col-md-12">
											<div class="md-form mb-0">
												<input required type="text" id="subject" name="subject" class="form-control">
												<label for="subject" class="">Subject</label>
											</div>
										</div>
									</div>
									<!--Grid row-->

									<!--Grid row-->
									<div class="row">

										<!--Grid column-->
										<div class="col-md-12">

											<div class="md-form">
												<textarea required type="text" id="message" name="message" rows="12" class="form-control md-textarea"></textarea>
												<label for="message">Your message</label>
											</div>

										</div>
									</div>
									<!--Grid row-->

								</form>

								<div class="text-center text-md-left">
									<a class="btn btn-primary" onclick="document.getElementById('contact-form').submit();">Send</a>
								</div>
								<div class="status"></div>
							</div>
							<!--Grid column-->


						</div>

					</section>
		            <h2>Monthly Top Sellers</h2>
		       		<?php
		       			$month = date('m');
		       			$conn = $pdo->open();

		       			try{
		       			 	$inc = 3;	
						    $stmt = $conn->prepare("SELECT *, SUM(quantity) AS total_qty FROM details LEFT JOIN sales ON sales.id=details.sales_id LEFT JOIN products ON products.id=details.product_id WHERE MONTH(sales_date) = '$month' GROUP BY details.product_id ORDER BY total_qty DESC LIMIT 6");
						    $stmt->execute();
						    foreach ($stmt as $row) {
						    	$image = (!empty($row['photo'])) ? 'images/'.$row['photo'] : 'images/noimage.jpg';
						    	$inc = ($inc == 3) ? 1 : $inc + 1;
	       						if($inc == 1) echo "<div class='row'>";
	       						echo "
	       							<div class='col-sm-4'>
	       								<div class='box box-solid'>
		       								<div class='box-body prod-body'>
		       									<img src='".$image."' width='100%' height='230px' class='thumbnail'>
		       									<h5><a href='product.php?product=".$row['slug']."'>".$row['name']."</a></h5>
		       								</div>
		       								<div class='box-footer'>
		       									<b>&#36; ".number_format($row['price'], 2)."</b>
		       								</div>
	       								</div>
	       							</div>
	       						";
	       						if($inc == 3) echo "</div>";
						    }
						    if($inc == 1) echo "<div class='col-sm-4'></div><div class='col-sm-4'></div></div>"; 
							if($inc == 2) echo "<div class='col-sm-4'></div></div>";
						}
						catch(PDOException $e){
							echo "There is some problem in connection: " . $e->getMessage();
						}

						$pdo->close();

		       		?> 
	        	</div>
	        	<div class="col-sm-3">
	        		<?php include 'includes/sidebar.php'; ?>
	        	</div>
	        </div>
	      </section>
	     
	    </div>
	  </div>
  
  	<?php include 'includes/footer.php'; ?>
</div>

<?php include 'includes/scripts.php'; ?>
</body>
</html>