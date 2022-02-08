# rubocop: disable Style
require 'date'
require_relative 'corrector'
require_relative 'rental'

class Person
  @@people = []
  attr_reader :corrector
  attr_accessor :id, :name, :age, :rentals

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

  def rent_book(book, date = Time.now.strftime('%d/%m/%Y %H:%M'))
    book_to_rent = Rental.new(date, book, self)
    book.rentals << book_to_rent unless book.rentals.include?(book_to_rent)
    book_to_add = Rental.new(date, book, self)
    @rentals << book_to_add unless @rentals.include?(book_to_add)
  end

  def display
    puts 'This is a person'
  end

  private

  def of_age?
    @age >= 18
  end
end

# rubocop: enable Style
