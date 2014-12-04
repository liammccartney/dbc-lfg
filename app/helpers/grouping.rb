class Grouping
  attr_reader :group_size, :groups_amount
  attr_accessor :extra_students, :groups, :students

  def initialize(args)
    @students = args[:students]
    @groups_amount = args.fetch(:groups_amount, 4)
    @group_size = args.fetch(:group_size, 4)
    @groups = {}
    @extra_students = []
  end

  def get_groups
    remove_extra_students

    group_number = 1

    shuffle_students.each_slice(4) do |new_group|
       groups["group_#{group_number}"] = new_group
        group_number += 1
    end

    if extra_students?
      distribute_extra_students
    end

    groups
  end

  def shuffle_students
    students.shuffle
  end

  def remove_extra_students
    self.extra_students = self.students.pop(students.length % group_size.to_i)
  end

  def distribute_extra_students

    extra_students.each do |student|
      group_number = rand(1..groups.length)
      groups["group_#{group_number}"] << student
    end

  end

  def extra_students?
    !extra_students.empty?
  end

end