# rubocop: disable Style/OptionalBooleanParameter
require_relative 'corrector'
require_relative 'rental'

class Person
  attr_reader :id, :corrector
  attr_accessor :name, :age, :rentals

  def initialize(age, name = 'Unknown', parent_permission = true, rentals = [])
    @id = rand(1..10_000)
    @age = age
    @name = name
    @parent_permission = parent_permission
    @rentals = rentals
    @corrector = Corrector.new
  end

  def can_use_services?
    is_of_age? || @parent_permission
  end

  def validate_name
    @name = @corrector.correct_name(@name)
  end

  def rent_book(date, book)
    bookToRent = Rental.new(date, book, self)
    book.rentals << bookToRent unless book.rentals.include?(bookToRent)
    bookToAdd = Rental.new(date, book, self)
    @rentals << bookToAdd unless @rentals.include?(bookToAdd)
  end

  private

  def of_age?
    @age >= 18
  end
end
# rubocop: enable Style/OptionalBooleanParameter
