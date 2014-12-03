get '/groups/:cohort_name/:cohort_id/:date' do
  groups = current_user.groups.where(cohort_id: params[:cohort_id])
  @groups_by_date = select_groups_by_date(groups, params[:date])
  if request.xhr?
    erb :'groups/groups_by_date', locals: {cohort_name: params[:cohort_name]}, layout: false
  else
    erb :'groups/groups_by_date', locals: {cohort_name: params[:cohort_name]}
  end
end
