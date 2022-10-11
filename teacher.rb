require './person'

class Teacher < Person
  attr_accessor :specialization
  def initialize(specialization, age, name = 'Unknown', id = nil, parent_permission: true)
    super(age, name, id, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def self.create_teacher
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp.capitalize
    Teacher.new(specialization, age, name)
  end
end
