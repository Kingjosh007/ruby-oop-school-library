require_relative 'data_related'

# rubocop: disable Layout/LineLength
# rubocop: disable Style
class Rental
  @@rentals_filename = 'rentals.json'
  @@rentals = []
  attr_accessor :date, :book, :person, :rentals

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
  end

  def display
    "\n\n\t\t" + "Date: ".black.on_magenta + "#{@date}" + "\n" + " Book: ".black.on_magenta + "'#{@book.title}'" + "\n" + " Author: ".black.on_magenta + " #{@book.author}"
  end

  def self.overwrite_rentals(arr)
    @@rentals = arr
  end
end

# rubocop: enable Layout/LineLength
# rubocop: enable Style
