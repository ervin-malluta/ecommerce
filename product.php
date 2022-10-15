<?php include 'includes/session.php'; ?>
<?php
	$conn = $pdo->open();

	$slug = $_GET['product'];
	
	try{
		 		
	    $stmt = $conn->prepare("SELECT *, products.name AS prodname, category.name AS catname, products.id AS prodid FROM products LEFT JOIN category ON category.id=products.category_id WHERE slug = :slug");
	    $stmt->execute(['slug' => $slug]);
	    $product = $stmt->fetch();
	}
	catch(PDOException $e){
		echo "There is some problem in connection: " . $e->getMessage();
	}
	//page view
	$now = date('Y-m-d');
	if($product['date_view'] == $now){
		$stmt = $conn->prepare("UPDATE products SET counter=counter+1 WHERE id=:id");
		$stmt->execute(['id'=>$product['prodid']]);
	}
	else{
		$stmt = $conn->prepare("UPDATE products SET counter=1, date_view=:now WHERE id=:id");
		$stmt->execute(['id'=>$product['prodid'], 'now'=>$now]);
	}

?>
<?php include 'includes/header.php'; ?>
<body class="hold-transition skin-blue layout-top-nav">
<script>
(function(d, s, id) {
	var js, fjs = d.getElementsByTagName(s)[0];
	if (d.getElementById(id)) return;
	js = d.createElement(s); js.id = id;
	js.src = 'https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.12';
	fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));
</script>
<div class="wrapper">

	<?php include 'includes/navbar.php'; ?>
	 
	  <div class="content-wrapper">
	    <div class="container">

	      <!-- Main content -->
	      <section class="content">
	        <div class="row">
	        	<div class="col-sm-9">
	        		<div class="callout" id="callout" style="display:none">
	        			<button type="button" class="close"><span aria-hidden="true">&times;</span></button>
	        			<span class="message"></span>
	        		</div>
		            <div class="row">
		            	<div class="col-sm-6">
		            		<img src="<?php echo (!empty($product['photo'])) ? 'images/'.$product['photo'] : 'images/noimage.jpg'; ?>" width="100%" class="zoom" data-magnify-src="images/large-<?php echo $product['photo']; ?>">
		            		<br><br>
		            		<form class="form-inline" id="productForm">
		            			<div class="form-group">
			            			<div class="input-group col-sm-5">
			            				
			            				<span class="input-group-btn">
			            					<button type="button" id="minus" class="btn btn-default btn-flat btn-lg"><i class="fa fa-minus"></i></button>
			            				</span>
							          	<input type="text" name="quantity" id="quantity" class="form-control input-lg" value="1">
							            <span class="input-group-btn">
							                <button type="button" id="add" class="btn btn-default btn-flat btn-lg"><i class="fa fa-plus"></i>
							                </button>
							            </span>
							            <input type="hidden" value="<?php echo $product['prodid']; ?>" name="id">
							        </div>
			            			<button type="submit" class="btn btn-primary btn-lg btn-flat"><i class="fa fa-shopping-cart"></i> Add to Cart</button>
			            		</div>
		            		</form>
		            	</div>
		            	<div class="col-sm-6">
							<div class="row">
		            			<h1 class="page-header"><?php echo $product['prodname']; ?></h1>
								<input type="hidden" name="product_id" value = ''>
								<?php
									if(isset($_SESSION["user"])){
										$user_id = $_SESSION["user"];
										$product_id = $product['prodid'];
										
										
										$stmt = $conn->prepare("SELECT count(*) as count from favorites where product_id =:product_id and user_id = :user_id");
										$stmt->execute(['product_id'=>$product_id, 'user_id'=>$user_id]);
										$row = $stmt->fetch();
										$count = $row['count'];
										$color = 'btn-primary';
										if($count){
											$color = 'btn-warning';
										}
										echo "<form action='add_to_favorite.php' method='POST'>
										<input type='hidden' value='". $product['prodid'] . "' name='product_id'>
										<button class='btn ". $color." ' type='submit'>
											<svg xmlns='http://www.w3.org/2000/svg' width='16' height='16'
											 fill='currentColor' class='bi bi-star' viewBox='0 0 16 16'>
												<path d='M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 
												4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 
												3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513
												 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523
												  3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.565.565 0 0
												   0-.163-.505L1.71 6.745l4.052-.576a.525.525 0 0 0 .393-.288L8 
												   2.223l1.847 3.658a.525.525 0 0 0 .393.288l4.052.575-2.906
												    2.77a.565.565 0 0 0-.163.506l.694 3.957-3.686-1.894a.503.503 0 0 0-.461 0z'/>
											</svg>Add to favorites
										</button>
									</form>";
									}
								
								?>
							</div>
		            		<h3><b>&#36; <?php echo number_format($product['price'], 2); ?></b></h3>
		            		<p><b>Category:</b> <a href="category.php?category=<?php echo $product['cat_slug']; ?>"><?php echo $product['catname']; ?></a></p>
		            		<p><b>Description:</b></p>
		            		<p><?php echo $product['description']; ?></p>
		            	</div>
						
		            </div>
					<br>
					<div class="row" >
						<?php
							if(isset($_SESSION['error'])){
								echo "
								<div class=' callout callout-danger text-center'>
									<p>".$_SESSION['error']."</p> 
								</div>
								";
								unset($_SESSION['error']);
							}
						?>
						<h1>Add you review</h1>
						<form action="add_review.php" method="POST">
							<?php
								echo "<input type='hidden' name='product_id' value=".$product['prodid'].">";
							?>
							<textarea required name="comment" id="comment" cols="110" rows="10"></textarea>
							<br>
							<button class="btn btn-primary" type="submit">Add Review</button>
						</form>
					</div>
					<br/>
					<div class="row">
						<?php
							$stmt = $conn->prepare("SELECT review.*, users.firstname, users.lastname
											 from review INNER JOIN users on user_id = users.id where product_id = :prodid");
						    $stmt->execute(["prodid" => $product['prodid']]);
						    foreach ($stmt as $row) {
								echo"
									<div class='col-sm-10'>
									<div class='box box-solid'>
										<div class='box-header with-border'>
											<h3 class='box-title'><b>".$row['firstname']." ".$row['lastname'] ."</b></h3>
										</div>
										<div class='box-body'>
											<p>".$row['comment']."</p>
											<h4>".$row['created_on']."</h4>	

										</div>
									</div>
								</div>
								
								";
							
							}
						
						?>
					</div>
				    <div class="fb-comments" data-href="http://localhost/ecommerce/product.php?product=<?php echo $slug; ?>" data-numposts="10" width="100%"></div> 
	        	</div>
	        	<div class="col-sm-3">
	        		<?php include 'includes/sidebar.php'; ?>
	        	</div>
	        </div>
	      </section>
	     
	    </div>
	  </div>
  	<?php $pdo->close(); ?>
  	<?php include 'includes/footer.php'; ?>
</div>

<?php include 'includes/scripts.php'; ?>
<script>
$(function(){
	$('#add').click(function(e){
		e.preventDefault();
		var quantity = $('#quantity').val();
		quantity++;
		$('#quantity').val(quantity);
	});
	$('#minus').click(function(e){
		e.preventDefault();
		var quantity = $('#quantity').val();
		if(quantity > 1){
			quantity--;
		}
		$('#quantity').val(quantity);
	});

});
</script>
</body>
</html>