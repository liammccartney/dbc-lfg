get '/groups/:group_id/edit' do |group_id|
  group = Group.find(group_id)
  if request.xhr?
    erb :'groups/edit', layout: false, locals: {group: group}
  else
    erb :'groups/edit', locals: {group: group}
  end
end

put '/groups/:group_id/edit' do |group_id|
  params[:students].each do |student_id, student_name|
    Group.find(group_id).students.find(student_id).update(name: student_name)
  end
  redirect ("/groups/#{group_id}")
end

delete '/groups/delete' do
  Group.find(params[:group_id]).destroy
  redirect('/')
end