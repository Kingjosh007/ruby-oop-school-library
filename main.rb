require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'corrector'
require_relative 'classroom'
require_relative 'book'
require_relative 'rental'

b = Student.new(24, 'Classroom 1', 'King')
c = Teacher.new(38, 'Biology', 'Mr. Smith')
myco = Corrector.new
pers = Person.new("35", 'Benoit Delafontaine', false)
book1 = Book.new('The Hobbit', 'J.R.R. Tolkien')
book2 = Book.new('The Lord of the Rings', 'J.R.R. Tolkien')
# book3 = Book.new('The Catcher in the Rye', 'J.D. Salinger')
# book4 = Book.new('The Grapes of Wrath', 'John Steinbeck')


# myco.correct_name('KingJoChewa')
p pers
pers.validate_name
p pers
p.can_use_services?

# p b
# b.rent_book(book1)
# p b
# p book1

# p c
# c.rent_book(book2)
# p book2
# p c
# c.rent_book(book1)
# p c
# p book1
