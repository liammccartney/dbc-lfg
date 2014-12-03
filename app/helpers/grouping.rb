class Grouping
  attr_reader :group_size, :groups_amount, :students
  attr_accessor :extra_students

  def initalize(args)
    @students = args[:students]
    @groups_amount = args[:groups_amount]
    @group_size = args[:target_group_size]
  end

  def get_groups

  end

  def shuffle_students
    students.shuffle
  end

  def remove_extra_students
    extra_students = students.pop(students.length % group_size)
  end


end