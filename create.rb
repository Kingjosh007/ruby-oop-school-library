require_relative 'book'
require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'
require_relative 'classroom'
require_relative 'colors_utils'

class Creator
  def self.create(option)
    case option
    when 'Book'
      BookCreator.create
    when 'Person'
      PersonCreator.create
    when 'Rental'
      RentalCreator.create
    else
      puts "Nothing to create"
    end
  end
end

class BookCreator
  def self.create
    puts `clear`
    puts "\n\n\n\t\t  BOOK CREATION \n\n".magenta
    print "\t\t" + " Title: ".black.on_magenta + "   "
    title = gets.chomp

    print "\n\t\t" + " Author: ".black.on_magenta + "   "
    author = gets.chomp

    book = Book.new(title, author)
    Book.class_variable_get(:@@books) << book

    puts "\n\n\t\t" + " Book added successfully ".bold.on_green

    puts "\n\n\n\t\t Press any key to go back to the main menu"
    print "\t\t  "
    gets.chomp
  end
end

class PersonCreator

  def self.create_a_student
    print 'Age: '
    age = gets.chomp.to_i

    print 'Name: '
    name = gets.chomp

    print 'Class: '
    classroom = Classroom.new(gets.chomp)

    parent_permission = false
    print 'Has parent permission? [Y/N]: '
    perm = gets.chomp.downcase
    if perm == 'y'
      parent_permission = true
    end

    student = Student.new(age, classroom, name, parent_permission)
    Person.class_variable_get(:@@people) << student

    puts 'Student created successfully'
    sleep 2
  end

  def self.create_a_teacher
    print 'Age: '
    age = gets.chomp.to_i

    print 'Name: '
    name = gets.chomp

    print 'Specialization: '
    specialization = gets.chomp

    teacher = Teacher.new(age, specialization, name)
    Person.class_variable_get(:@@people) << teacher

    puts 'Teacher created successfully'
    sleep 2
  end

  def self.create
    print 'Do you want to create a student (1) or teacher (2) [Input a number]: '
    option = gets.chomp.to_i

    case option
    when 1
      self.create_a_student
    when 2
      self.create_a_teacher
    else
      puts 'Invalid input. Kindly type 1 or 2'
    end
  end
end

class RentalCreator
  def self.create
    puts `clear`
    puts '\n\n\n Select a book from the following list by number'
    Book.class_variable_get(:@@books).each_with_index { |book, index|
      puts "#{index + 1}) Title: #{book.title}, Author: #{book.author}"
    }

    book_id = gets.chomp.to_i

    puts 'Select a person from the following list by number (not id)'
    Person.class_variable_get(:@@people).each_with_index do |person, index|
      puts "#{index + 1}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end

    person_id = gets.chomp.to_i

    print 'Date: '
    date = gets.chomp.to_s

    rental = Rental.new(date, Book.class_variable_get(:@@books)[book_id - 1],
                        Person.class_variable_get(:@@people)[person_id - 1])
    Rental.class_variable_get(:@@rentals) << rental

    puts 'Rental created successfully'
    sleep 2
  end
end
