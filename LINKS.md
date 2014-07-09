#CRUD 

[CRUD Operations in Controllers](https://github.com/woodchucks-2014/blog-1-anonymous-blog-challenge/blob/ben-greg/app/controllers/articles.rb)

[User Based Controllers](https://github.com/woodchucks-2014/blog-1-anonymous-blog-challenge/blob/ben-greg/app/controllers/users.rb)

[Relevant Helpers](https://github.com/woodchucks-2014/blog-1-anonymous-blog-challenge/blob/ben-greg/app/helpers/users.rb)

#Views

[Layout](https://github.com/woodchucks-2014/blog-1-anonymous-blog-challenge/blob/ben-greg/app/views/layout.erb)

[New User Sign Up](https://github.com/woodchucks-2014/blog-1-anonymous-blog-challenge/blob/ben-greg/app/views/users/user_signup.erb)

[Current User Login](https://github.com/woodchucks-2014/blog-1-anonymous-blog-challenge/blob/ben-greg/app/views/users/login.erb) - Note that for error handling purposes, you don't want current users to get good validation. Just choose a message like "Invalid credentials" - in comparison, you want to rely on AR for detailed error messages for new user sign up. 

[Conditional User Profile](https://github.com/woodchucks-2014/blog-1-anonymous-blog-challenge/blob/ben-greg/app/views/users/profile.erb) - condiitional edit and delete functionality. 

[New Post](https://github.com/woodchucks-2014/blog-1-anonymous-blog-challenge/blob/ben-greg/app/views/articles/new_article.erb)

[Edit](https://github.com/woodchucks-2014/blog-1-anonymous-blog-challenge/blob/ben-greg/app/views/articles/edit.erb) - Note that on **edit**, controller will have a puts and form will have a hidden input type, name _method and value of put.

Delete - generally, just link with a redirect. In AR, **you should enable destructive settings to sever connections if relevant.**


#Validations in Active Record

<a href="https://github.com/woodchucks-2014/anagram-server-2-ludicrous-speed-challenge">Anagram Server</a>


#Sinatra

<a href="https://github.com/woodchucks-2014/blog-2-multi-author-challenge/branches" >Multi Author Blog Challenge<a>
<br>
<a href="https://github.com/woodchucks-2014/blog-2-multi-author-challenge/blob/helper-methods/source/app/helpers/sessions.rb">Tanner Helper Methods </a>


#Javascript

<a href="https://github.com/woodchucks-2014/orange-jasmine-challenge">Orange Tree TDD</a>
<br>
<a href="https://github.com/woodchucks-2014/javascript-racer-1-front-end-challenge/tree/tanner">Tanner JS Racer OOP </a>

#CSS

Floats are useful in allowing for multiple column layouts.
However, creating separate divs is another method of achieving the same goal.

#Helpful Group Projects

<a href="https://github.com/RJNY/casino_dogeale">Casino Dogeale </a>
Be wary of using this, because the group is known for being a bit sloppy.
<br>
<a href="https://github.com/kaiprt/DBCLightning">DBC Lightning</a>
