class Rental
  attr_accessor :date, :book, :person
  attr_reader :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
    book.rentals.push(self)
    person.rentals.push(self)
  end
end
