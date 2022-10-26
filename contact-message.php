<?php
	include 'includes/session.php';

	$conn = $pdo->open();

    if(isset($_POST['message'])){
        $name = $_POST['name'];
        $email = $_POST['email'];
        $subject = $_POST['subject'];
        $message = $_POST['message'];
        
        try{
            if($name == '' || $email == '' ||$subject == '' ||$message == '' ){
                throw new PDOException("Error Processing Request", 1);
            }
            $stmt = $conn->prepare("INSERT INTO contact_messages(name, email, subject, message)
                        Values(:name, :email, :subject, :message)");
            $stmt->execute(['name'=>$name, 'email'=>$email,'subject'=>$subject,'message'=>$message]);
            
            $_SESSION['message_success'] = "Thank you for your feed back";
            $pdo->close();
            header('location: contact.php');
  
        }catch(PDOException $e){
            $_SESSION['message_error'] = "Error saving your message. Please try again!";
            header('location: contact.php');
        }
    
    }
	
	
?>