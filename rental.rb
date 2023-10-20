class Rental
  attr_accessor :date, :book, :person

  def initialize(date, person, book)
    @date = date
    @person = person
    @book = book
    person.rental.push(self)
    book.rental.push(self)
  end
end
