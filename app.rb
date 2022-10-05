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
      permission = ''
      until %w[Y N].include?(permission)
        print 'Has parrent permission? [Y/N]:'
        permission = gets.chomp.capitalize
      end
      student = Student.new(nil, age, name, parent_permission: permission == 'Y')
      add_student(student)
    when 2
      print 'Specialization: '
      specialization = gets.chomp.capitalize
      teacher = Teacher.new(specialization, age, name)
      add_teacher(teacher)
    end
  end

  def create_person
    person_type = 0
    until [1, 2].include?(person_type)
      print 'Do you want to create a student (1) or do you want to create a teacher (2)? [Input the number]:'
      person_type = gets.chomp.to_i
    end
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    create_person_type(person_type, age, name)
    person = person_type == 1 ? 'Student' : 'Teacher'
    print "\n#{person} created successfully\n"
  end

  # Create a book.
  def add_book(book)
    @books << book
  end

  def create_book
    title = ''
    author = ''
    while title.empty?
      print 'Title : '
      title = gets.chomp
    end
    while author.empty?
      print 'Author: '
      author = gets.chomp
    end
    book = Book.new(title, author)
    add_book(book)
    print "\nBook created successfully\n"
  end
  # Create a rental.
  # List all rentals for a given person id.
end

app = App.new
app.create_book
app.list_books
