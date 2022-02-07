require_relative 'book'
require_relative 'person'
require_relative 'rental'
require_relative 'colors_utils'

class Listing
  def self.list(option, id = 0)
    case option
    when 'Book'
      BookListing.list
    when 'Person'
      PersonListing.list
    when 'Rentals'
      RentalListing.list(id)
    else
      puts "Nothing to list"
    end
end

class BookListing < Listing
    def self.list
        puts `clear`
    puts "\n\n\n\t\t     ALL AVAILABLE BOOKS \n\n\n".magenta.on_black.bold
    puts "\n\t\t" + " There are no books yet! Please add some books. ".on_red if @books.empty?

    Book.books.each { |book|
      puts "\n\t\tTitle:".bold.underline.magenta + "  #{book.title.italic}" + "   " + "Author:".bold.underline.magenta + " #{book.author}"
    }

    puts "\n\n\n\t\t Press any key to go back to the main menu"
    gets.chomp

    end
end

class PersonListing < Listing
    def self.list
        puts `clear`
    puts "\n\n\n\t\t     ALL REGISTERED PEOPLE \n\n\n".magenta.on_black.bold
    puts "\n\t\t" + " There are no people yet! Please add a student or teacher.".on_red if @people.empty?

    @people.map { |person| puts display_person(person) }
    puts "\n\n\n Press any key to go back to the main menu"
    gets.chomp
    end
end

