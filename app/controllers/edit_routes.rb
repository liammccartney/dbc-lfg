get '/groups/:group_id/edit' do |group_id|
  group = Group.find(group_id)
  erb :'groups/edit', locals: {group: group}
end

delete '/groups/delete' do
  Group.find(params[:group_id]).destroy
  redirect('/')
end