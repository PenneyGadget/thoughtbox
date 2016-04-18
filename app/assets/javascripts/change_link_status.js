var changeLinkStatus = function() {
  $("table").delegate(".unread-btn", "click", function() {
    var $button = $(this);
    var $link = $button.closest(".link");
    
  // $.ajax({
  //   type: "PUT",
  //   debugger
  //   url: "api/v1/links/" + $link.attr("id") + ".json",
  //   data: false,
  //   success: function() {
  //     console.log($link.attr("id"));
  //   }
  // });
  });
};
