cohorts = DBC::Cohorts.all

cohorts.each do |cohort|
  Cohort.create(name: cohort.name, year)
end