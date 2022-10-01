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

  def can_use_services?
    of_age? || @parent_permission == true
  end

  # Private methods

  private

  def of_age?
    if @age >= 18
      returns true
    else
      returns false
    end
  end
end
