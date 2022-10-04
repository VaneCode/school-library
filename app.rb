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
  # Create a book.
  # Create a rental.
  # List all rentals for a given person id.
end
