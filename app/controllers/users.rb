get '/users/home/:id' do
  @users = User.all
  @skills = Skill.all
  erb :user_home
end

get '/users/addskill/:id' do
  @skills = current_user.skills if !current_user.skills.empty?
  erb :skills
end

get '/signout' do
  session.clear
  redirect '/'
end

post '/users/addskill/:id' do
  skill = Skill.create(name: params[:skills][:name], context: params[:skills][:context])
  if skill.save
    current_user.skills << skill
    @user_skills = current_user.skills
    redirect "/users/addskill/#{current_user.id}"
  else
    @errors = skill.errors.messages
  end
end
