cohorts = DBC::Cohort.all

cohorts.each do |cohort|
  Cohort.create(name: cohort.name, socrates_id: cohort.id)
end