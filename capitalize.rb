require_relative 'decorator'
require_relative 'person'
class CapitalizeDecorator < Decorator
  def initialize(person)
    super()
    @c_name = person
  end

  def correct_name
    @c_name.correct_name.capitalize
  end
end
