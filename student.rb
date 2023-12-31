require_relative 'person'

class Student < Person
  attr_accessor :classroom

  def initialize(age, classroom, name = 'Uknown', parent_permission: true)
    super(age, name, parent_permission)
    @classroom = classroom
    classroom.students.push(self)
  end

  def play_hook
    '¯\(ツ)/¯'
  end
end
