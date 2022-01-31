require_relative 'person'
require_relative 'student'
require_relative 'teacher'

b = Student.new(24, 'Classroom 1', 'King')
c = Teacher.new(38, 'Biology', 'Mr. Smith')

b.play_hooky
c.can_use_services?
