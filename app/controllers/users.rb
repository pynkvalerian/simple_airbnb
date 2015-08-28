# REGISTER NEW USER
post '/register' do
  name = params[:name]
  email = params[:email]
  password = params[:password]

  @new_user = User.create(name: name, email: email, password: password)
  session[:user_id] = @new_user.id

  redirect to("/dashboard")
end

# USER LOG IN
post '/log_in' do
  email = params[:email]
  password = params[:password]

  @user = User.authenticate(email, password)
  if @user.nil?
    redirect to('/')
  else
    session[:user_id] = @user.id
    redirect to("/dashboard")
  end
end

# USER DASHBOARD
get '/dashboard' do
  if session[:user_id].nil?
    redirect to('/')
  else
    @current_user = User.find(session[:user_id])
    @properties = Property.list_user_property(session[:user_id])
    erb :dashboard
  end
end

# USER LOG OUT
post '/log_out' do
  session[:user_id] = nil
  redirect to('/')
end