get '/' do
  if current_user
    # erb :something
  else
    erb :'auth/signup'
  end
end