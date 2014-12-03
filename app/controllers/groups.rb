get '/groups' do
  # display all groups made by user
  erb :'groups/all'
end

get '/groups/new' do
  # form for generating new groups from a cohort
  erb :'groups/new_group_form'
end


post '/groups/new' do
  user = current_user
  cohort_name = "#{params[:cohort][:name]} #{params[:cohort][:year]}"
  cohort = Cohort.find_by(name: cohort_name)

  params[:group][:groups_amount] ||= 4
  params[:group][:group_size] ||= 4


  students = DBC::Cohort.find(cohort.socrates_id).students

  students.each do |student|
    cohort.students.find_or_create_by(name: student.name, socrates_id: student.id)
  end

  student_names = students.map { |student| student.name }

  grouper = Grouping.new(students: student_names, group_size: params[:group][:group_size].to_i, groups_amount: params[:group][:groups_amount].to_i)



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
  erb :'groups/group_by_cohort', locals: {cohort_name: params[:cohort_name], cohort_id: params[:cohort_id]}
end

