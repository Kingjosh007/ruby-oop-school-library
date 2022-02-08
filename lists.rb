require_relative 'book'
require_relative 'person'
require_relative 'rental'
require_relative 'colors_utils'
require_relative 'main'

class Listing
  def self.list(option)
    case option
    when 'Books'
      BookListing.list
      App.menu
    when 'People'
      PersonListing.list
      App.menu
    when 'Rentals'
      RentalListing.list
      App.menu
    else
      puts 'Nothing to list'
    end
  end
end

class BookListing < Listing
  def self.list
    puts `clear`
    puts "\n\n\n\t\t     ALL AVAILABLE BOOKS \n\n\n".magenta.on_black.bold
    if Book.class_variable_get(:@@books).empty?
      puts "\n\t\t #{' There are no books yet! Please add some books. '.on_red}"
    end

    Book.class_variable_get(:@@books).each do |book|
      puts "\n\t\t #{'Title:'.bum}  #{book.title.italic}   #{'Author:'.bum}  #{book.author}"
    end
    puts "\n\n\n\t\t Press any key to go back to the main menu"
    gets.chomp
  end
end

class PersonListing < Listing
  def self.list
    puts `clear`
    puts "\n\n\n\t\t     ALL REGISTERED PEOPLE \n\n\n".magenta.on_black.bold
    if Person.class_variable_get(:@@people).empty?
      puts "\n\t\t #{' There are no people yet! Please add a student or teacher. '.on_red}"
    end
    Person.class_variable_get(:@@people).map { |person| puts person.display }
    puts "\n\n\n Press any key to go back to the main menu"
    gets.chomp
  end
end

class RentalListing < Listing
  def self.list
    puts "\t\t Please enter the ID of the person: \t\t  "
    id = gets.chomp.to_i

    if Rental.class_variable_get(:@@rentals).empty?
      puts "\n\n There are no rentals yet for this person"
    else
      puts 'Rentals:'
      Rental.class_variable_get(:@@rentals).each do |rental|
        puts rental.display if rental.person.id == id
      end
    end
    puts "\n\n\n\t\t Press any key to go back to the main menu"
    gets.chomp
  end
end
