get '/groups' do
  # display all groups made by user
  if request.xhr?
    erb :'groups/all', layout: false
  else
    erb :'groups/all'
  end
end

get '/groups/new' do
  # form for generating new groups from a cohort
  if request.xhr?
    erb :'groups/new_group_form', layout: false
  else
    erb :'groups/new_group_form'
  end
end

get '/groups/:id' do |id|
  group = Group.find(id)
  erb :'groups/single', locals: {group: group}
end


post '/groups/new' do
  user = current_user
  cohort_name = "#{params[:cohort][:name]} #{params[:cohort][:year]}"

  cohort = Cohort.find_by(name: cohort_name)
  target_group_amount = params[:group][:groups_amount]
  target_group_size = params[:group][:group_size]


  target_group_amount = 4 if target_group_amount.empty?
  target_group_size = 4 if target_group_size.empty?


  students = DBC::Cohort.find(cohort.socrates_id).students

  students.each do |student|
    cohort.students.find_or_create_by(name: student.name, socrates_id: student.id)
  end

  student_names = students.map { |student| student.name }

  grouper = Grouping.new(students: student_names, group_size: target_group_size, groups_amount: target_group_amount)



  grouper.get_groups.each do |group, members|
    user.groups.create(cohort_id: cohort.id)
    members.each do |student|
      user.groups.last.students << Student.find_by(name: student)
    end
  end

  redirect ("/groups/#{cohort.name}/#{cohort.id}/#{Date.today}")
end

get '/groups/:cohort_name/:cohort_id' do
  @groups = current_user.groups.where(cohort_id: params[:cohort_id])
  if request.xhr?
    erb :'groups/group_by_cohort', locals: {cohort_name: params[:cohort_name], cohort_id: params[:cohort_id]}, layout: false
  else
    erb :'groups/group_by_cohort', locals: {cohort_name: params[:cohort_name], cohort_id: params[:cohort_id]}
  end
end