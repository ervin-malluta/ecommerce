<?php
	include 'includes/session.php';
    $conn = $pdo->open();


    if(!isset($_SESSION["user"])){
        $_SESSION['error'] = 'You must loggin!';
    }
    if(isset($_POST['product_id'])){
        $product_id = $_POST['product_id'];
        $user_id = $_SESSION["user"];
        $comment = $_POST['comment'];
		$now = date('Y-m-d');
        $stmt = $conn->prepare("SELECT * from products where id =:id");
        $stmt->execute(['id' => $product_id]);
        $product = $stmt->fetch();
        try{
            $stmt = $conn->prepare("Insert into review (product_id, user_id, comment, created_on) values (:product_id , :user_id, :comment, :now)");
            $stmt->execute(['product_id'=>$product_id, 'user_id'=>$user_id, 'comment'=>$comment, 'now'=>$now]);
        }catch(PDOException $e){
            $pdo->close();
            $_SESSION['error'] = "You can only add one review for each product";
            header('location: product.php?product='.$product['slug']);
        }

        header('location: product.php?product='.$product['slug']);
    }





?>