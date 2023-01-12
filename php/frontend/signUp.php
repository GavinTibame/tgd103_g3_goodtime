<?php

    include("../connect.php");

    // $email = $_POST["email"];
    // $pwd = $_POST["pwd"];
    // $username = $_POST["username"];
    // $phone = $_POST["phone"];
    // $address = $_POST["address"];
    $email = "member3@goodtime.com";
    $pwd = "member3";    
    $username = "member3";
    $phone = "0987654321";
    $address = "100台北市中正區濟南路一段321號";

    function getMemberList($email){ // 1. 檢查email重覆
        $sql = "SELECT * from MEMBER WHERE EMAIL = :email";

        $statement = connectDB()->prepare($sql);
        $statement->bindValue(":email", $email);
        $statement->execute();
        $data = $statement->fetchAll();

        return $data;
    }
    
    // function addAddress($email, $address){ // 3. 新增bind地址
    //     $data = getMemberList($email);
        
    //     $mid = $data[0]["ID"];
        
        
    // }

    function joinMember($email, $pwd, $username, $phone, $address){
        // 2. 會員註冊
        $dbn = connectDB();
        $dbn ->beginTransaction();
        $sql = "INSERT INTO MEMBER(EMAIL, `PASSWORD`, USERNAME, PHONE)
                VALUES(:email, :pwd, :username, :phone)";

        $statement = $dbn ->prepare($sql);
        $statement->bindValue(":email", $email);
        $statement->bindValue(":pwd", $pwd);
        $statement->bindValue(":username", $username);
        $statement->bindValue(":phone", $phone);
        $statement->execute();
        
        // $statement = $dbn ->query("SELECT LAST_INSERT_ID()");
        $mid = $dbn ->lastInsertId();
        print_r( $dbn ->lastInsertId());
        if(empty($mid)){
            // $dbn ->rollBack();
            echo "失敗";
        }else{
            $sql = "INSERT INTO `ADDRESS`(`LOCATION`, FK_ADDRESS_MEMBER_ID)
                    VALUES(:address, :mid)";
        
            $statement =  $dbn->prepare($sql);
            $statement->bindValue(":address", $address);
            $statement->bindValue(":mid", $mid);
            $statement->execute();
             $dbn ->commit();
            }
    }

    $data = getMemberList($email);

    if(count($data) > 0){
        echo "已有帳號使用此電子郵件地址。請選擇其他電子郵件地址。";
    }else{
        joinMember($email, $pwd, $username, $phone, $address);
        echo "會員註冊成功，請重新登入";
    }
?>