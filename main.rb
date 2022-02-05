require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'classroom'
require_relative 'book'
require_relative 'rental'
require_relative 'colors_utils'

# rubocop:disable Metrics

class App
    def initialize
      @people = []
      @books = []
      @rentals = []
    end
  
    def run
      puts "\n\n\n\t\t ---------------------------".bold.on_magenta
      puts "\t\t|  OOP SCHOOL LIBRARY APP  |".bold.on_magenta
      puts "\t\t ---------------------------".bold.on_magenta
      sleep 0.8
      menu
    end
  
    def menu
      puts
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
      puts 'There are no books yet! Kindly add books.' if @books.empty?
  
      @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
      sleep 0.75
      menu
    end
  
    def list_all_people
      puts 'There are no people yet! Kindly add a student or teacher.' if @people.empty?
      @people.map { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
      sleep 0.75
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
  
      print 'Has parent permission? [Y/N]: '
      perm = gets.chomp.downcase
      if(perm == 'y')
        parent_permission = true
      else
        parent_permission = false
  
      student = Student.new(age, @class, name, parent_permission)
      @people << student
  
      puts 'Student created successfully'
      sleep 0.75
      menu
    end
  
    def create_a_teacher
      print 'Age: '
      age = gets.chomp.to_i
  
      print 'Name: '
      name = gets.chomp
  
      print 'Specialization: '
      specialization = gets.chomp
  
      teacher = Teacher.new(specialization, age, name)
      @people << teacher
  
      puts 'Teacher created successfully'
      sleep 0.75
      menu
    end
  
    def create_a_book
      print 'Title: '
      title = gets.chomp
  
      print 'Author: '
      author = gets.chomp
  
      book = Book.new(title, author)
      @books << book
  
      puts 'Book added successfully'
      sleep 0.75
      menu
    end
  end
  
  def create_a_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }
  
    book_id = gets.chomp.to_i
  
    puts 'Select a person from the following list by number (not id)'
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  
    person_id = gets.chomp.to_i
  
    print 'Date: '
    date = gets.chomp.to_s
  
    rental = Rental.new(date, @people[person_id], @books[book_id])
    @rentals << rental
  
    puts 'Rental created successfully'
    sleep 0.75
    menu
  end
  
  def list_rentals_by_person_id
    print 'ID of person: '
    id = gets.chomp.to_i
  
    puts 'Rentals:'
    @rentals.each do |rental|
      puts "Date: #{rental.date}, Book: '#{rental.book.title}' by #{rental.book.author}" if rental.person.id == id
    end
    sleep 0.75
    menu
  end
  
  def main
    app = App.new
    app.run
  end
  # rubocop:enable Metrics
  main
