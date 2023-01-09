function file () {
    var that = this;
    $('.file-box').on('change', '#upload', function(e) {
     var files = e.target.files;
     console.log(files);
     if (files.length > 0) {
     for (var i = 0; i < files.length; i++) {
      var reader = new FileReader();
      reader.onload = function () {
      var text = `
       <div class="img-list">
       <img src="${this.result}" alt="">
       <div class="del-img">删除</div>
       </div>
      `
      $('.img-box').append(text);
      };
      reader.readAsDataURL(files[i]);
      that.filesList.push(files[i]);
     };
     };
    })
    }