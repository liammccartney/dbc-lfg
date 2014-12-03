get '/' do
  if current_user
    # erb :something
  else
    erb :signup
  end
end