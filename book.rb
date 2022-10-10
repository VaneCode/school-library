require './rental'
class Book
  attr_accessor :title, :author
  attr_reader :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(person, date)
    Rental.new(date, person, self)
  end

  # List all books.
  def self.list_books(books)
    if books.length.zero?
      puts 'There are not books at the moment.'
    else
      books.each_with_index { |book, idx| puts "#{idx}) Title: \"#{book.title}\", Author: #{book.author}" }
    end
  end

  # Create a book
  def self.create_book
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
    Book.new(title, author)
    print "Book created successfully\n"
  end
end
