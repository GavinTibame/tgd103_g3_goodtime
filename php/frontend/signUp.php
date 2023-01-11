<?php

    include("../connect.php");

    $email = $_POST["email"];
    $pwd = $_POST["pwd"];
    $username = $_POST["username"];
    $phone = $_POST["phone"];
    $address = $_POST["address"];
    // $email = "member2@goodtime.com";
    // $pwd = "member2";    
    // $username = "member2";
    // $phone = "0987654321";
    // $address = "110台北市信義區莊敬路334號1樓";

    function getMemberList($email){ // 檢查email重覆
        $sql = "SELECT * from member WHERE email = :email";

        $statement = connectDB()->prepare($sql);
        $statement->bindValue(":email", $email);
        $statement->execute();
        $data = $statement->fetchAll();

        return $data;
    }
    
    function addAddress($email, $address){ // 新增bind地址
        $data = getMemberList($email);
        
        $mid = $data[0]["ID"];
        
        $sql = "INSERT INTO `address`(`location`, fk_address_member_id)
                VALUES(:address, :mid)";
    
        $statement = connectDB()->prepare($sql);
        $statement->bindValue(":address", $address);
        $statement->bindValue(":mid", $mid);
        $statement->execute();
    }

    function joinMember($email, $pwd, $username, $phone, $address){
        // 會員註冊
        $sql = "INSERT INTO member(email, `password`, username, phone)
                VALUES(:email, :pwd, :username, :phone)";

        $statement = connectDB()->prepare($sql);
        $statement->bindValue(":email", $email);
        $statement->bindValue(":pwd", $pwd);
        $statement->bindValue(":username", $username);
        $statement->bindValue(":phone", $phone);
        $statement->execute();

        addAddress($email, $address);
    }

    $data = getMemberList($email);

    if(count($data) > 0){
        echo "已有帳號使用此電子郵件地址。請選擇其他電子郵件地址。";
    }else{
        joinMember($email, $pwd, $username, $phone, $address);
        echo "會員註冊成功，請重新登入"
    }
?>