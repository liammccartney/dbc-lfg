get '/groups' do
  # display all groups made by user
  @user = User.find(current_user.id)
  erb :'groups/all'
end

get '/groups/new' do
  # form for generating new groups from a cohort
  erb :'groups/new_group_form'
end


post '/groups/new' do
  cohort_name = "#{params[:cohort][:name]} #{params[:cohort][:year]}"
  cohort = Cohort.find_by(name: cohort_name)

  @students = DBC::Cohort.find(cohort.socrates_id).students

  redirect ('/')
  # students.each do |student|
  #   Student.find_or_create_by(name: student.name, socrates_id: student.id, cohort_id: cohort.id)
  # end
end