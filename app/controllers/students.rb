get '/students/delete' do
  @group = Group.find(params[:group_id])

  if request.xhr?
    erb :'students/remove_students', layout: false
  else
    erb :'students/remove_students'
  end

end

delete '/students/delete' do
  group = Group.find(params[:group_id])
  student = Student.find(params[:student_id])
  group_student = GroupStudent.find_by(group_id: group.id, student_id: student.id)
  group_student.delete
end