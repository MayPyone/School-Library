require './person'

class Student < Person
  def initialize(age, name: 'unknown', parent_permission: true, classroom: 'Unknown')
    @classroom = classroom
    super(age, name, parent_permission, classroom)
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end
