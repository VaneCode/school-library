# Private method is_of_age? that returns true if @age is greater or equal to 18 and false otherwise.
# Public method can_use_services? that returns true if person is of age or if they have permission from parents.

class Person
  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @parent_permission = parent_permission
    @age = age
  end
  # Getters and setters
  attr_reader :id
  attr_accessor :name, :age

  # Private methods

  private

  def of_age?
    returns true if @age >= 18
  end
end
