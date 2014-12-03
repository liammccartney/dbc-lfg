get '/login' do
  erb :'auth/login'
end

post '/login' do
  user = User.find_by(email: params[:user][:email]).try(:authenticate, params[:user][:password])

  if user
    session[:user_id] = user.id
    redirect('/')
  else
    session[:errors] = set_error("Something didn't match up, try again")
    redirect('/login')
  end
end

get '/logout' do
  session[:user_id] = nil

  redirect('/')
end

get '/signup' do
  erb :'auth/signup'
end

post '/signup' do
  new_user = User.new(params[:user])

  if new_user.save
    session[:user_id] = new_user.id
    redirect('/')
  else
    session[:errors] = new_user.errors.messages
    redirect('/signup')
  end

end