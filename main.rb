require_relative 'person'
require_relative 'student'
require_relative 'teacher'

a = Person.new(23, "John")
b = Student.new(24, "Classroom 1", "King");
c = Teacher.new(38, "Biology", "Mr. Smith");

c
c.can_use_services?