class Student < ActiveRecord::Base
  belongs_to :cohort

  has_many :groups, through: :group_students
end
