require_relative 'person'
require_relative 'colors_utils'

class Teacher < Person
  attr_accessor :specialization

  def initialize(age, specialization, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def display
    puts "[Teacher]".bold.green + "  " + "Name:".underline.green + "   #{@name}" + "   " + "ID:".underline.green + " " + "#{@id}" + "  " + "Age:".underline.green + " #{@age}"
  end
end
