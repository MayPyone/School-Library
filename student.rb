require_relative 'person'

class Student < Person
  attr_reader :classroom, :role

  def initialize(age, name: 'unknown', parent_permission: true, classroom: 'Unknown', role: 'student')
    super(age, name: name, parent_permission: parent_permission)
    @classroom = classroom
    @role = role
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
