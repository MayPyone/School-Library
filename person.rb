require_relative 'nameable'
require_relative 'rental'
class Person < Nameable
  def initialize(age, name: 'unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rental = []
  end

  attr_accessor :name, :age, :rental
  attr_reader :id

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age >= 18
  end

  def add_rental(date)
    rental = Rental.new(date, self)
    @rental.push(rental)
  end
end
