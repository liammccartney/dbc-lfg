class Group < ActiveRecord::Base
  belongs_to :user
  belongs_to :cohort

  has_many :group_students
  has_many :students, through: :group_students
end
