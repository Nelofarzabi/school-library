require_relative 'person'

class Student < Person
  def initialize(age, classroom, name = 'Uknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hook
    '¯\(ツ)/¯'
  end
end
