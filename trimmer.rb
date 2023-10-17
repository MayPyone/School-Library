require_relative 'decorator'

class TrimmerDecorator < Decorator
  def initialize(person)
    super()
    @person = person
  end

  def correct_name
    if @person.name.length > 10
      @person.name.strip.slice(0, 10)
    else
      @person.name
    end
  end
end
