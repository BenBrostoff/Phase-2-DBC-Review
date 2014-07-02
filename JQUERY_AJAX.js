// You need to set up all jQuery with document ready and remember to use
// e.preventDefault()

$(function (){
  $('#viz_form').submit(function(e){
    //this happens if form is submitted
    //preent the default behavior of a form (it should do nothing in our case)
    e.preventDefault();

    //send an ajax request to our action
    $.ajax({
      url: "/follower_viz",
      type: "POST", //this could also be get or whatever
      //serialize the form and use it as data for our ajax request
      data: $(this).serialize(),
      //the type of data we are expecting back from server, could be json too
      dataType: "html", // generally, we've been working with text
      success: function(data) {
        //if our ajax request is successful, replace the content of our viz div with the response data
        console.log("SUCCESS"); //for debugging purposes
        $('#viz').html(data);
      }
    });

// From a recent exercise (via Ben and Greg)...

// public/js/application.js looks like this

$(document).ready(function() {
  $(".grandma").hide();
  $("body").on("submit", function(e) {
    e.preventDefault();
    grandmaResponse = $('form').serializeArray();
    var grandma = $.ajax ({
      url: "/grandma",
      type: "POST",
      data: $('form').serialize() // data going in
    });

    grandma.done(function(data){ // data from controller
      console.log("success");
      $("p").text(data);
      $(".grandma").fadeIn();
    });
  });
});


// Here's what the controller looks like:

post '/grandma' do
  // the return of this controller (usually last line) is what is passed into 41
  @user_input = params[:user_input] // params[:user_input] derives from the data in 37
  if @user_input.length == 0
    "Don't waste my time - you looked like you were about to speak!"
  elsif @user_input == @user_input.upcase
    "Lower your voice honey."
  elsif @user_input.length > 20
    "Grandma fell asleep because you were speaking for too long."
  else
    "That's too soft for grandma's brittle ears."
  end
end










