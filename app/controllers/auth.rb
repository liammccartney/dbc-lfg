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