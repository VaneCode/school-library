require './book'
require './teacher'
require './student'
require './rental'
class App
  attr_reader :rentals

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
      @books.each_with_index { |book, idx| puts "#{idx}) Title: \"#{book.title}\", Author: #{book.author}" }
    end
  end

  # List all people.
  def list_people
    if @people.length.zero?
      puts 'There are not people at the moment.'
    else
      @people.each_with_index do |person, idx|
        puts "#{idx}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
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
    print "#{person} created successfully\n"
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
    print "Book created successfully\n"
  end

  # Create a rental.
  def add_rental(rental)
    @rentals << rental
  end

  def create_rental
    idx_book = nil
    idx_person = nil
    until (0..@books.length - 1).include? idx_book
      puts 'Select a book from the following list by number'
      list_books
      idx_book = gets.chomp.to_i
    end
    until (0..@people.length - 1).include? idx_person
      puts 'Select a person from the following list by number (not id)'
      list_people
      idx_person = gets.chomp.to_i
    end
    print 'Date: '
    date = gets.chomp
    rental = Rental.new(date, @people[idx_person], @books[idx_book])
    add_rental(rental)
    print "Rental created successfully\n"
  end

  def rental_control
    if @books.length.zero?
      puts 'There are not books for rental'
    elsif @people.length.zero?
      puts 'There are no registered people to make the rental'
    elsif @people.length.zero? && @books.length.zero?
      puts 'There are no people and books registered to make the rental'
    else
      create_rental
    end
  end

  # List all rentals for a given person id.

  def rentals_by_person_id
    print 'ID of person: '
    id = gets.chomp.to_i
    person = nil
    @people.each { |p| person = p if p.id == id }
    if person.nil?
      puts "There is not person with the id #{id} registered"
    elsif person.rentals.length.zero?
      puts "Person #{id}: #{person.name} doesn't have rentals"
    else
      puts 'Rentals:'
      person.rentals.each do |rental|
        puts "Date: #{rental.date}, Book: \"#{rental.book.title}\" by #{rental.book.author}"
      end
    end
  end
end
