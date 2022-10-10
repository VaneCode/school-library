require './book'
require './teacher'
require './student'
require './rental'
class App
  attr_reader :rentals, :books, :people

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def add_student(student)
    @people << student
  end

  def add_teacher(teacher)
    @people << teacher
  end

  # Create a book.
  def add_book(book)
    @books << book
  end

  # Create a rental.
  def add_rental(rental)
    @rentals << rental
  end
end
