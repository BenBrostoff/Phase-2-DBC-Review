#Errors

# Handler looks like this:

get '/users/signup' do
  @errors = session[:errors] #set equal to User.errors.messages (via AR)
  session.delete[:errors]
  erb :signup
end

# Helper looks like this:

helpers do
  def show_errors_for(error_type)
    if @errors && @errors[error_type]
      @errors[error_type].join('; ')
    end
  end
end

# HTML looks like this:

"<%= show_errors_for(:email)%>" #this would be the error for an email issue
"<%= show_errors_for(:password)%>" #this would be the error for a password issue
# and so on... put these under edit forms and sign up forms

# Sessions
# Remember to always enable sessions!
# You should only store the user_id in sessions and draw off it.

helpers do
  def current_user
    @user ||= User.find(session[:user_id])
  end

  def logged_in?
    current_user
  end
end

# And handlers are as follows:

before '/users/*' do
  if !logged_in?
    redirect '/'
  end
end

before '/posts/*' do
  if !logged_in?
    redirect '/'
  end
end
