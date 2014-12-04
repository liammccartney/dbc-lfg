get '/students/delete' do
  @group = Group.find(params[:group_id])
  erb :'students/remove_students'
end

delete '/students/delete' do
  group = Group.find(params[:group_id])
  student = Student.find(params[:student_id])
  group_student = GroupStudent.find_by(group_id: group.id, student_id: student.id)
  group_student.delete
end