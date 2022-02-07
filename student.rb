# rubocop: disable Layout/LineLength
# rubocop: disable Style
require_relative 'person'
require_relative 'colors_utils'

class Student < Person
  attr_accessor :classroom

  def initialize(age, classroom, name = 'Unknown', parent_permission = true)
    super(age, name, parent_permission)
    @classroom = Classroom.new(classroom)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def display
    puts "[Student]".bold.magenta + "  " + "Name:".underline.magenta + "   #{@name}" + "   " + "ID:".underline.magenta + " " + "#{@id}" + "  " + "Age:".underline.magenta + " #{@age}"
  end
end

# rubocop: enable Layout/LineLength
# rubocop: enable Style
