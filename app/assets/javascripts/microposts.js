$(document).ready(function(){
  $("#micropost_picture").bind("change", function() {
    var size_in_megabytes = this.files[0].size/1024/1024;
    if (size_in_megabytes > Settings.image_max_size_mb) {
      alert(I18n.t("js.file_too_big"));
    }
  });
});
