require './book'
require './teacher'
require './student'
require './rental'
class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  # List all books.
  def list_books
    if @books.length.zero?
      puts 'There are not books at the moment.'
    else
      @books.each { |book| puts "Title: \"#{book.title}\", Author: #{book.author}" }
    end
  end

  # List all people.
  def list_people
    if @people.length.zero?
      puts 'There are not people at the moment.'
    else
      @people.each { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
    end
  end

  # Create a person (teacher or student, not a plain Person).
  def add_student(student)
    @people << student
  end

  def add_teacher(teacher)
    @people << teacher
  end

  def create_person_type(type, age, name)
    case type
    when 1
      print 'Has parrent permission? [Y/N]:'
      permission = gets.chomp.capitalize == 'Y'
      student = Student.new(nil, age, name, parent_permission: permission)
      add_student(student)
    when 2
      print 'Specialization: '
      specialization = gets.chomp.capitalize
      teacher = Teacher.new(specialization, age, name)
      add_teacher(teacher)
    end
  end

  def create_person
    print 'Do you want to create a student (1) or do you want to create a teacher (2)? [Input the number]:'
    person_type = gets.chomp.to_i
    print 'Age:'
    age = gets.chomp.to_i
    print 'Name:'
    name = gets.chomp
    create_person_type(person_type, age, name)
    person = person_type == 1 ? 'Student' : 'Teacher'
    puts "#{person} created successfully"
  end
  # Create a book.
  # Create a rental.
  # List all rentals for a given person id.
end

app = App.new
app.create_person
