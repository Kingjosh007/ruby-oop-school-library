require_relative 'book'
require_relative 'person'
require_relative 'rental'
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
    Book.books << book

    puts "\n\n\t\t" + " Book added successfully ".bold.on_green

    puts "\n\n\n\t\t Press any key to go back to the main menu"
    print "\t\t  "
    gets.chomp
  end
end

class PersonCreator
    def self.create
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

    private 

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
        Person.people << student

        puts 'Student created successfully'
        sleep 2
    end

    def create_a_teacher
        print 'Age: '
        age = gets.chomp.to_i
    
        print 'Name: '
        name = gets.chomp
    
        print 'Specialization: '
        specialization = gets.chomp
    
        teacher = Teacher.new(age, specialization, name)
        Person.people << teacher
    
        puts 'Teacher created successfully'
        sleep 2
    end
end
    
    class RentalCreator
    def self.create
        puts `clear`
        puts "\n\n\n\t\t  RENTAL CREATION \n\n".magenta
        print "\t\t" + " Date: ".black.on_magenta + "   "
        date = gets.chomp
    
        print "\n\t\t" + " Book: ".black.on_magenta + "   "
        book = gets.chomp
    
        print "\n\t\t" + " Person: ".black.on_magenta + "   "
        person = gets.chomp
    
        rental = Rental.new(date, book, person)
        Rental.rentals << rental
    
        puts "\n\n\t\t" + " Rental added successfully ".bold.on_green
    
        puts "\n\n\n\t\t Press any key to go back to the main menu"
        print "\t\t  "
        gets.chomp
    end

    
end