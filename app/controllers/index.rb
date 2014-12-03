get '/' do
  if current_user
    @user = User.find(current_user.id)
    erb :index
  else
    erb :'auth/signup'
  end
end