
function resizeImage(base64Str) {
  var img = new Image();
  img.src = base64Str;
  var canvas = document.createElement('canvas');
  var MAX_WIDTH = 300;
  var MAX_HEIGHT = 300;
  var width = img.width;
  var height = img.height;

  if (width > height) {
    if (width > MAX_WIDTH) {
      height *= MAX_WIDTH / width;
      width = MAX_WIDTH;
    }
  } else {
    if (height > MAX_HEIGHT) {
      width *= MAX_HEIGHT / height;
      height = MAX_HEIGHT;
    }
  }
  canvas.width = width;
  canvas.height = height;
  var ctx = canvas.getContext('2d');
  ctx.drawImage(img, 0, 0, width, height);
  var srcEncoded = ctx.canvas.toDataURL('image/jpeg', 0.5);
  return srcEncoded;
  // canvas.toDataURL("image/jpeg",0.5);
}

window.readURL = function (input) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();
    reader.onload = function(e) {
      $('#imagePreview').css('background-image', 'url('+e.target.result +')');
      $('#imagePreview').hide();
      $('#imagePreview').fadeIn(650);
      $.ajax({
        url :  gon.path,
        type : gon.action,
        data : { avatar: e.target.result }
      });

    }
    console.log('ddddddd');
    reader.readAsDataURL(input.files[0]);
  }
}
// $("#user_avatar").change(function() {
//     readURL(this);
// });



