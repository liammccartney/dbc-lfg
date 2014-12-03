get '/' do
  if current_user
    erb :index
  else
    erb :'auth/signup'
  end
end