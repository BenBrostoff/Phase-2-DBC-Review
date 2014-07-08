// You need to set up all jQuery with document ready and remember to use
// e.preventDefault()

// Form Example
// Request:

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


// Controller:

post '/grandma' do
  // the return of this controller (last line) is what is passed into 41
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


// JSON Example

//Request
$(document).ready(function(){

 $('#get_color').on('click', function(e) {
    e.preventDefault();
    var ajaxRequest = $.ajax({
      type: "POST",
      url: "/color",
      dataType: "json", // defining type
    });
    ajaxRequest.done(function(response) {
      var rand = response.cell // getting cell attribute from JSON object
      console.log("success");
      $("li").eq(rand).css("background-color", response.color); // getting color attribute from JSON object
    });
    ajaxRequest.fail(function(response){
      console.log("Fail");
    });
  });
});

//Controller

post '/color' do
  cell= rand(1..9)
  color= "#" + "%06x" % (rand * 0xffffff)
  {color: color, cell: cell}.to_json
end

// Partial / HTML Example
// Request:

$(document).ready(function() {
  $('#loading').hide(); // GIF load bar

  $('#twitter').submit(function(e){
    $('#loading').show().html("<img src='ajaxloader.gif'>")
    e.preventDefault();
    var handle = $('#twitter').serialize(); // read input name
    var ajaxRequest = $.ajax({
      url: '/find_user',
      type: "POST",
      data: handle // passed into 106 and 109 on controller
    });

    ajaxRequest.done(function(response) {
      console.log(response);
      $('#loading').hide();
      $('.tweets').html("");
      $('.tweets').append(response); // append HTML grabbed from controller
    });

    ajaxRequest.fail(function(response) {
      console.log('FAILED');
    });
  });
});

// Controller:
post '/find_user' do
  @user = TwitterUser.find_by_username(params[:username])
  @checker = @user.stale?
  if @user == nil
    @user = TwitterUser.create(username: params[:username])
    @test = "I CREATED A NEW USER"
    @user.fetch_tweets!
  end
  @average_time = @user.average_tweet_difference
  @user.refresh_tweets(@average_time)
  @tweets = @user.tweets.limit(10)
  erb :tweets_page //HTML passed into line 91 and used on line 95
end








