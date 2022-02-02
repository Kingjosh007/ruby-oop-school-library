require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'corrector'

b = Student.new(24, 'Classroom 1', 'King')
c = Teacher.new(38, 'Biology', 'Mr. Smith')
myco = Corrector.new
pers = Person.new(35, 'Benoit Delafontaine')

myco.correct_name('KingJoChewa')
p pers
pers.validate_name
p pers

b.play_hooky
c.can_use_services?
