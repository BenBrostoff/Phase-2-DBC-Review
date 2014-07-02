#User Sign-Up

post '/user/signup' do
  user = User.new( params[:user] )
  if user.save
    session["user"] = user
    redirect '/user/home/'
  else
    session[:errors] = user.errors.messages
    redirect '/user/signup'
  end
end

# All errors get passed to hash, which can be accessed via 
# helper method (see HELPERS.rb)

#In a many to many relationship, you create associations:

#The Shovel Way (Matt recommends)
post '/newgame' do
  @player_1 = Player.create(name: params[:name_1], initials: params[:initials_1])
  @player_2 =Player.create(name: params[:name_2], initials: params[:initials_2])
  @game = Game.create(url_view: "http://www.espn.com")
  session[:game_id] = @game.id
  @game.players << @player_1
  @game.players << @player_2
  @game.save
  session[:begin] = Time.now
end

#The Hacky Join Table Way

post '/articles/new' do
  tags = (params[:article][:tags]).split(',').map(&:strip)
  new_article = Article.create(title: params[:article][:title], content: params[:article][:content])
  article_id = new_article.id
  tags.each do |tag|
    unless Tag.where(name: tag).nil?
      tag = Tag.create(name: tag)
      ArticleTag.create(article_id: article_id, tag_id: tag.id)
      #equivalent to new_article.tags << tag
      #new_article.save
    else
      ArticleTag.create(article_id: article_id, tag_id: tag.id)
    end
  end
end



