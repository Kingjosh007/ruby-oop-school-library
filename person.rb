require_relative 'corrector'

class Person
  attr_reader :id, :corrector
  attr_accessor :name, :age

  def initialize(age, name = 'Unknown', parent_permission)
    @id = rand(1..10_000)
    @age = age
    @name = name
    @parent_permission = parent_permission
    @corrector = Corrector.new()
  end

  def can_use_services?
    is_of_age? || @parent_permission
  end

  def validate_name
    @name = @corrector.correct_name(@name)
  end

  private

  def of_age?
    @age >= 18
  end
end
