require './person'

class Teacher < Person
  def initialize(age, name: 'unknown', parent_permission: true, specialization: 'unknown')
    super(age, name, parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end