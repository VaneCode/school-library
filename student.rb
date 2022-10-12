require './person'
class Student < Person
  attr_reader :classroom

  def initialize(classroom, age, name = 'Unknown', id = nil, parent_permission: true)
    super(age, name, id, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def classroom=(classroom)
    @classroom = classroom
    @classroom.push(self) unless @classroom.students.include?(self)
  end

  def self.create_student
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    permission = ''
    until %w[Y N].include?(permission)
      print 'Has parrent permission? [Y/N]:'
      permission = gets.chomp.capitalize
    end
    Student.new(nil, age, name, parent_permission: permission == 'Y')
  end
end

student = Student.new(nil, 23, 'aron', 56, false)
puts student.id
puts student.name