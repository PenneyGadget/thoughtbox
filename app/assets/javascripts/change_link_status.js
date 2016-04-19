var changeLinkStatus = function() {
  $("table").delegate(".unread-btn", "click", function() {
    var $button = $(this);
    var $link = $button.closest(".link");

    if($button.attr("class").indexOf("danger") > 0) {
      $button.text("Mark as Unread");
      $button.addClass("btn-success").removeClass("btn-danger");
    } else {
      $button.text("Mark as Read");
      $button.addClass("btn-danger").removeClass("btn-success");
    }

  $.ajax({
    type: "PUT",
    url: "api/v1/links/" + $button.attr("id") + ".json",
    data: false,
    success: function() {
      console.log("HI");
    },
    error: function(xhr){
        console.log(xhr.responseText);
      }
    });
  });
};
