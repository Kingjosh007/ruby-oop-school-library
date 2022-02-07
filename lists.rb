require_relative 'book'
require_relative 'person'
require_relative 'rental'
require_relative 'colors_utils'

class Listing
  def self.list(option)
    case option
    when 'Books'
      BookListing.list
    when 'People'
      PersonListing.list
    when 'Rentals'
      RentalListing.list
    else
      puts 'Nothing to list'
    end
  end
end

class BookListing < Listing
  def self.list
    puts `clear`
    puts "\n\n\n\t\t     ALL AVAILABLE BOOKS \n\n\n".magenta.on_black.bold
    puts "\n\t\t" + " There are no books yet! Please add some books. ".on_red if Book.books.empty?

    Book.books.each { |book|
      puts "\n\t\tTitle:".bold.underline.magenta + "  #{book.title.italic}" + "   " + "Author:".bold.underline.magenta + " #{book.author}"
    }
    end

    puts "\n\n\n\t\t Press any key to go back to the main menu"
    gets.chomp
   end
end

class PersonListing < Listing
  def self.list
    puts `clear`
    puts "\n\n\n\t\t     ALL REGISTERED PEOPLE \n\n\n".magenta.on_black.bold
    puts "\n\t\t" + " There are no people yet! Please add a student or teacher.".on_red if Person.people.empty?

    Person.people.map { |person| puts person.display }
    puts "\n\n\n Press any key to go back to the main menu"
    gets.chomp
  end
end

class RentalListing < Listing
  def self.list
    puts "\t\t Please enter the ID of the person: \t\t  "
    id = gets.chomp.to_i

    if Rental.rentals.empty?
      puts "\n\n There are no rentals yet for this person"
    else
      puts 'Rentals:'
      Rental.rentals.each do |rental|
      puts rental.display if rental.person.id == id
    end
    puts "\n\n\n\t\t Press any key to go back to the main menu"
    gets.chomp
  end
end
