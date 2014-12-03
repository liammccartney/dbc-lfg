get '/groups/:cohort_name/:cohort_id/:date' do
  @groups = current_user.groups.where(cohort_id: params[:cohort_id])
  @groups_by_date = @groups.where(:created_at.to_date == params[:date]))
  erb :'groups/groups_by_date', locals: {cohort_name: params[:cohort_name]}
end
