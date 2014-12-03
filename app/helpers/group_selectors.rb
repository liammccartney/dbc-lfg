def select_unique_group_corhorts
  cohort_names = current_user.groups.map {|group| Cohort.find(group.cohort_id).name }.uniq
  cohort_names.map { |cohort_name| Cohort.find_by(name: cohort_name) }
end

def select_unique_group_creation_dates(cohort_name)
  cohort = Cohort.find_by(name: cohort_name)
  groups = current_user.groups.where(cohort_id: cohort.id)
  groups.map { |group| group.created_at.to_date }.uniq
end