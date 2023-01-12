// handleCallback用來處理回傳憑證，登入後有呼叫這個function表示成功登入
function handleCallback(response) {
  console.log(response);
}

//credential 是 base64 的 JWT Token，可以用解碼的方式拿到使用者資料，這邊用stackoverflow 找到的 function 來執行
function parseJwt(token) {
  var base64Url = token.split(".")[1];
  var base64 = base64Url.replace(/-/g, "+").replace(/_/g, "/");
  var jsonPayload = decodeURIComponent(
    atob(base64)
      .split("")
      .map(function (c) {
        return "%" + ("00" + c.charCodeAt(0).toString(16)).slice(-2);
      })
      .join("")
  );

  return JSON.parse(jsonPayload);
}
function handleCallback(response) {
  const data = parseJwt(response.credential);
  console.log(data);
}

//忘記密碼燈箱

// 開啟彈跳視窗
$("a.log_in-foreget-pwd").on("click", function () {
  $("div.overlay").fadeIn();
});

// 確認送出按鈕
$("button.btn_modal_close, div.overlay").on("click", function (e) {
  $("div.overlay").fadeOut();
});

$("div.overlay > article").on("click", function (e) {
  e.stopPropagation();
});
