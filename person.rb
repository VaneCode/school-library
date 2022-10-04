require './nameable'
require './capitalize_decorator'
require './trimmer_decorator'

class Person < Nameable
  # Getters and setters
  attr_reader :id
  attr_accessor :name, :age

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @parent_permission = parent_permission
    @age = age
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  # Private methods

  private

  def of_age?
    @age >= 18
  end
end

# Check decorator pattern in class Person
person = Person.new(22, 'maximilianus')
p person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
p capitalized_person.correct_name
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
p capitalized_trimmed_person.correct_name
