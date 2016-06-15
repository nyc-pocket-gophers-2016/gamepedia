$(document).ready(function(){
  $("#add-new-game").on("click", function(event){
    event.preventDefault();
    var $target = $(event.target);

    $.ajax({
      method: "get",
      url: $target.attr("href")
    }).done(function(response){
      $("#new-game-form-div").append(response)
    })
  })

})
