require_relative './person.rb'

class Student < Person
  def initialize(id, age, classroom, name = "Uknown", parent_permission = true)
    super(id, age, name, parent_permission)
    @classroom = classroom
  end

  def play_hook
    "¯\(ツ)/¯"
  end
end

