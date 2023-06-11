function logout() {
    // 執行登出相關的處理
  
    // 在這裡可以添加你需要的登出相關程式碼，例如發送 Ajax 請求到後端處理登出
  
    // 設定顯示登出訊息的元素
    var messageElement = document.getElementById("message");
  
    // 設定登出訊息
    var message = "您已登出";
  
    // 顯示登出訊息
    messageElement.textContent = message;
    messageElement.style.color = "white";
  
    // 重新導向到指定的 HTML 頁面
    setTimeout(function() {
      window.location.href = "index.html";
    }, 2000); // 2 秒後重新導向
  }