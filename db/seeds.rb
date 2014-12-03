cohorts = DBC::Cohort.all

cohorts.each do |cohort|
  Cohort.create(name: cohort.name)
end