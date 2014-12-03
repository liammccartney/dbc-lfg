def select_groups_by_cohort
  # user = current_user
  cohort_names = current_user.groups.map {|group| Cohort.find(group.cohort_id).name }.uniq
  cohort_names.map { |cohort_name| Cohort.find_by(name: cohort_name) }
end

def select_group_by_date(cohort_name)

  Cohort.find_by(name: cohort_name)
end