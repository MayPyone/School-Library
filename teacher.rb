require './person'

class Teacher < Person
  def initialize(age, name: 'unknown', parent_permission: true, specialization: 'unknown', role: 'teacher')
    super(age, name: name, parent_permission: parent_permission)
    @specialization = specialization
    @role = role
  end

  attr_reader :role

  def can_use_services?
    true
  end
end
