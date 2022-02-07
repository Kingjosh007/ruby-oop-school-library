class Rental
  @@rentals = []
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
  end

  def display
    "\n\n\t\t" + "Date: ".black.on_magenta + "#{@date}" + "\n" + " Book: ".black.on_magenta + "'#{@book.title}'" + "\n" + " Author: ".black.on_magenta + " #{@book.author}"
  end
end
