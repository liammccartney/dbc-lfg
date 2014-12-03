get '/groups' do
  # display all groups made by user
  @user = User.find(current_user.id)
  erb :'groups/all'
end

get '/groups/new' do
  # form for generating new groups from a cohort
  erb :'groups/new_group_form'
end