require './book'
require './teacher'
require './student'
require './rental'
class App
  def initialize
    @books = []
    @students = []
    @teachers = []
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
  # Create a person (teacher or student, not a plain Person).
  # Create a book.
  # Create a rental.
  # List all rentals for a given person id.
end
