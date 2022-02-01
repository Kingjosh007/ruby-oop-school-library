class Corrector
  attr_accessor :name
  
  def initialize(name)
    @name = name
  end

  # Create a method called correct_name that capitalizes the first letter of the name and trims the name to at most 10 characters.
    def correct_name(name)
        name.capitalize[0..10]
    end
end