require './nameable'
require './capitalize_decorator'
require './trimmer_decorator'
require './rental'

class Person < Nameable
  # Getters and setters
  attr_reader :id, :rentals
  attr_accessor :name, :age, :parent_permission

  def initialize(age, name = 'Unknown', id = nil, parent_permission: true)
    super()
    @id = id || Random.rand(1..1000)
    @name = name
    @parent_permission = parent_permission
    @age = age
    @rentals = []
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(book, date)
    Rental.new(date, self, book)
  end

  # List all people.
  def self.list_people(people)
    if people.empty?
      puts 'There are not people at the moment.'
    else
      people.each_with_index do |person, idx|
        puts "#{idx}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
  end

  # Create a person (teacher or student, not a plain Person).
  def self.create_person(people)
    person_type = 0
    until [1, 2].include?(person_type)
      print 'Do you want to create a student (1) or do you want to create a teacher (2)? [Input the number]:'
      person_type = gets.chomp.to_i
    end
    case person_type
    when 1 then person = Student.create_student
    when 2 then person = Teacher.create_teacher
    end
    people << person
    print "#{person.class} created successfully\n"
  end

  # Private methods

  private

  def of_age?
    @age >= 18
  end
end
