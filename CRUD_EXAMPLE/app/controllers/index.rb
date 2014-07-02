enable :sessions

get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/signup' do
  name = params[:sign_up][:name]
  email = params[:sign_up][:email]
  password = params[:sign_up][:password]
  user = User.new(name: name, email: email, password: password)
  if user.save
    session[:id] = user.id
    redirect "users/home/#{user.id}"
  else
    @errors = user.errors.messages
    erb :index
  end
end






