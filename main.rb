require_relative 'create'
require_relative 'lists'
require_relative 'colors_utils'

# rubocop: disable Style
# rubocop: disable Metrics

class App
  def run
    sleep 0.8
    menu
  end

  private

  def menu
    puts `clear`
    puts "\n\n\n\t\t ---------------------------".bold.on_magenta
    puts "\t\t|  OOP SCHOOL LIBRARY APP  |".bold.on_magenta
    puts "\t\t ---------------------------".bold.on_magenta
    puts "\t____________________________________________________".magenta
    puts "\n\t Please choose an option by entering a number"
    puts "\n\t\t" + " 1 ".brown.on_magenta + "- List all books\n"
    puts "\n\t\t" + " 2 ".brown.on_magenta + "- List all people\n"
    puts "\n\t\t" + " 3 ".brown.on_magenta + "- Create a person\n"
    puts "\n\t\t" + " 4 ".brown.on_magenta + "- Create a book\n"
    puts "\n\t\t" + " 5 ".brown.on_magenta + "- Create a rental\n"
    puts "\n\t\t" + " 6 ".brown.on_magenta + "- List all rentals for a given person id\n"
    puts "\n\t\t" + " 7 ".brown.on_magenta + "- " + " Exit".bold.on_red + "\n\t" + "#{"_" * 53}".magenta + "\n\n "
    print "\t\t  "
    option = gets.chomp.to_i

    get_option option
  end

  def get_option(input)
    case input
    when 1
      Listing.list('Books')
      menu
    when 2
      Listing.list('People')
      menu
    when 3
      Creator.create('Person')
      menu
    when 4
      Creator.create('Book')
      menu
    when 5
      Creator.create('Rental')
      menu
    when 6
      Listing.list('Rentals')
      menu
    when 7
      puts 'Thank you for using this app!'
    else
      puts 'Please enter a number between 1 and 7'
    end
  end
end

def main
  app = App.new
  app.run
end
# rubocop: enable Metrics
# rubocop: enable Style
main
