class Person
  attr_reader :id
  attr_accessor :name, :age
  
  def initialize(age, name="Unknown", parent_permission=true)
    @age = age
    @name = name
    @parent_permission = parent_permission
  end
  
  def can_use_services? 
    is_of_age? || @parent_permission
  end
  
  private
  def is_of_age?
    @age >= 18
  end
end