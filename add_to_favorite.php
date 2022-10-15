<?php
	include 'includes/session.php';
    $conn = $pdo->open();

  

    if(!isset($_SESSION["user"])){
        $_SESSION['error'] = 'You must loggin!';
    }
    if(isset($_POST['product_id'])){
        $product_id = $_POST['product_id'];
        $user_id = $_SESSION["user"];
        $stmt = $conn->prepare("SELECT * from products where id =:id");
        $stmt->execute(['id'=>$product_id]);
        $product = $stmt->fetch();

        $stmt = $conn->prepare("SELECT count(*) as count from favorites where product_id =:product_id and user_id = :user_id");
        $stmt->execute(['product_id'=>$product_id, 'user_id'=>$user_id]);
        $row = $stmt->fetch();
        
        if($row['count'] == 0){
            $stmt = $conn->prepare("Insert into favorites (product_id, user_id) values (:product_id , :user_id)");
            $stmt->execute(['product_id'=>$product_id, 'user_id'=>$user_id]);
        }else{
            $stmt = $conn->prepare("delete from favorites where product_id =:product_id and user_id = :user_id");
            $stmt->execute(['product_id'=>$product_id, 'user_id'=>$user_id]);
        }
 

        header('location: product.php?product='.$product['slug']);
    }





?>