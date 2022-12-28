//驗證活動名稱
function checkusrn1() {
  var check = false;
  var activity__name_el = document.getElementById("activity__name").value;

  if (activity__name_el.length == "") {
    document.getElementById("checktext1").innerHTML = `⚠️請填寫此欄位`;
    document.getElementById("checktext_1").innerHTML = "";
  } else {
    document.getElementById("checktext_1").innerHTML = "✅驗證成功";
    document.getElementById("checktext1").innerHTML = "";

    check = true;
  }

  return check;
}

//驗證申請單位
function checkusrn2() {
  var check = false;
  var applicant__unit = document.getElementById("applicant__unit").value;

  if (applicant__unit.length == 0) {
    document.getElementById("checktext2").innerHTML = `⚠️請填寫此欄位`;
  } else {
    document.getElementById("checktext2").innerHTML = " ";

    check = true;
  }
  return check;
}

//驗證負責人姓名
function checkusrn3() {
  var check = false;
  var principal__name = document.getElementById("principal__name").value;
  if (principal__name.length == 0) {
    document.getElementById("checktext3").innerHTML = `⚠️請填寫此欄位`;
  } else {
    document.getElementById("checktext3").innerHTML = " ";

    check = true;
  }
  return check;
}

//驗證聯絡人姓名
function checkusrn4() {
  var check = false;
  var Contact__name = document.getElementById("Contact__name").value;
  if (Contact__name.length == 0) {
    document.getElementById("checktext4").innerHTML = `⚠️請填寫此欄位`;
  } else {
    document.getElementById("checktext4").innerHTML = " ";

    check = true;
  }
  return check;
}

//驗證聯絡人電話
function checkusrn5() {
  var check = false;
  var Contact__phone = document.getElementById("Contact__phone").value;
  if (Contact__phone.length == 0) {
    document.getElementById("checktext5").innerHTML = `⚠️請填寫此欄位`;
  } else {
    document.getElementById("checktext5").innerHTML = " ";

    check = true;
  }
  return check;
}

/*
function checkpwd() {
  var check = false;
  var password = document.getElementById("password").value;
  if (password.length < 6) {
    document.getElementById("checktext2").innerHTML = " × 不要少於6位";
    check = false;
  } else {
    document.getElementById("checktext2").innerHTML = " √";
    check = true;
  }
  return check;
}
function checkpwdc() {
  var check = false;
  var password = document.getElementById("password").value;
  var pwdc = document.getElementById("pwdc").value;
  if (password != pwdc) {
    document.getElementById("checktext3").innerHTML = " × 兩次輸入密碼不一致";
    check = false;
  } else {
    document.getElementById("checktext3").innerHTML = " √";
    check = true;
  }
  return check;
}
function checkcb() {
  var check = false;

  if (!document.getElementsByName("checkbox")[0].checked) {
    document.getElementById("checktext4").innerHTML =
      " × 請同意我們的條款才可以繼續申請";
    check = false;
  } else {
    document.getElementById("checktext4").innerHTML = "";
    check = true;
  }
  return check;
}
function check() {
  var check = checkusrn() && checkpwd() && checkpwdc() && checkcb();
  return check;
}
*/
