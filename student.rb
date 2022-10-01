# Constructor extends parent's constructor by adding @classroom and a parameter for it.
# Method play_hooky that returns "¯\(ツ)/¯".
require './person'
class Student < Person
  def initialize(classroom, age, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission)
    @classroom = classroom
  end
end
