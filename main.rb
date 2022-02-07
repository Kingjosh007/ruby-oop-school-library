require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'classroom'
require_relative 'book'
require_relative 'rental'
require_relative 'colors_utils'

# rubocop: disable Layout/LineLength
# rubocop: disable Style
# rubocop: disable Metrics

class App
  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def run
    sleep 0.8
    menu
  end

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
    puts "\n\t\t" + " 7 ".brown.on_magenta + "- " + " Exit".bold.on_red + "\n\t____________________________________________________".magenta + "\n\n "
    print "\t\t  "
    option = gets.chomp.to_i

    get_option option
  end

  def get_option(input)
    case input
    when 1
      list_all_books
    when 2
      list_all_people
    when 3
      create_a_person
    when 4
      create_a_book
    when 5
      create_a_rental
    when 6
      list_rentals_by_person_id
    when 7
      puts 'Thank you for using this app!'
    else
      puts 'Please enter a number between 1 and 7'
    end
  end

  def list_all_books
    
  end

  def display_person(person)
    case "#{person.class}"
    when 'Student'
      puts "[#{person.class}]".bold.magenta + "  " + "Name:".underline.magenta + "   #{person.name}" + "   " + "ID:".underline.magenta + " " + "#{person.id}" + "  " + "Age:".underline.magenta + "#{person.age}"
    when 'Teacher'
      puts "[#{person.class}]".bold.green + "  " + "Name:".underline.green + "   #{person.name}" + "   " + "ID:".underline.green + " " + "#{person.id}" + "  " + "Age:".underline.green + "#{person.age}"
    else
      puts "[Person]"
    end
  end

  def list_all_people
    puts `clear`
    puts "\n\n\n\t\t     ALL REGISTERED PEOPLE \n\n\n".magenta.on_black.bold
    puts "\n\t\t" + " There are no people yet! Please add a student or teacher.".on_red if @people.empty?

    @people.map { |person| puts display_person(person) }
    puts "\n\n\n Press any key to go back to the main menu"
    gets.chomp
    menu
  end

  def create_a_person
    print 'Do you want to create a student (1) or teacher (2) [Input a number]: '
    option = gets.chomp.to_i

    case option
    when 1
      create_a_student
    when 2
      create_a_teacher
    else
      puts 'Invalid input. Kindly type 1 or 2'
    end
  end

  def create_a_student
    print 'Age: '
    age = gets.chomp.to_i

    print 'Name: '
    name = gets.chomp

    parent_permission = false
    print 'Has parent permission? [Y/N]: '
    perm = gets.chomp.downcase
    if perm == 'y'
      parent_permission = true
    end

    student = Student.new(age, @class, name, parent_permission)
    @people << student

    puts 'Student created successfully'
    sleep 2
    menu
  end

  def create_a_teacher
    print 'Age: '
    age = gets.chomp.to_i

    print 'Name: '
    name = gets.chomp

    print 'Specialization: '
    specialization = gets.chomp

    teacher = Teacher.new(age, specialization, name)
    @people << teacher

    puts 'Teacher created successfully'
    sleep 2
    menu
  end

  def create_a_book
    puts `clear`
    puts "\n\n\n\t\t  BOOK CREATION \n\n".magenta
    print "\t\t" + " Title: ".black.on_magenta + "   "
    title = gets.chomp

    print "\n\t\t" + " Author: ".black.on_magenta + "   "
    author = gets.chomp

    book = Book.new(title, author)
    @books << book

    puts "\n\n\t\t" + " Book added successfully ".bold.on_green

    puts "\n\n\n\t\t Press any key to go back to the main menu"
    print "\t\t  "
    gets.chomp
    menu
  end
end

def create_a_rental
  puts 'Select a book from the following list by number'
  @books.each_with_index { |book, index| puts "#{index + 1}) Title: #{book.title}, Author: #{book.author}" }

  book_id = gets.chomp.to_i

  puts 'Select a person from the following list by number (not id)'
  @people.each_with_index do |person, index|
    puts "#{index + 1}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
  end

  person_id = gets.chomp.to_i

  print 'Date: '
  date = gets.chomp.to_s

  rental = Rental.new(date, @books[book_id - 1], @people[person_id - 1])
  @rentals << rental

  puts 'Rental created successfully'
  sleep 2
  menu
end

def list_rentals_by_person_id
  puts "\t\t Please enter the ID of the person: \t\t  "
  id = gets.chomp.to_i

  if @rentals.empty?
    puts "\n\n There are no rentals yet for this person"
  else
    puts 'Rentals:'
    @rentals.each do |rental|
      puts "\n\n\t\t" + "Date: ".black.on_magenta + "#{rental.date}" + "\n" + " Book: ".black.on_magenta + "'#{rental.book.title}'" + "\n" + " Author: ".black.on_magenta + " #{rental.book.author}" if rental.person.id == id
    end
    puts "\n\n\n\t\t Press any key to go back to the main menu"
    gets.chomp
    menu
  end
end

def main
  app = App.new
  app.run
end
# rubocop: enable Metrics
# rubocop: enable Style
# rubocop: enable Layout/LineLength
main
