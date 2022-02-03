class Classroom
  attr_reader :students
  attr_accessor :label
  def initialize(label, students = [])
    @label = label
    @students = students
  end

  def add_student(student)
    @students << student unless @students.include?(student)
  end
end