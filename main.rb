require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'corrector'

b = Student.new(24, 'Classroom 1', 'King')
c = Teacher.new(38, 'Biology', 'Mr. Smith')
myco = Corrector.new()

myco.correct_name('KingJoChewa')
b.play_hooky
c.can_use_services?
