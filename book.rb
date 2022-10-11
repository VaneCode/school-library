require './rental'
class Book
  attr_accessor :title, :author
  attr_reader :rentals, :id

  def initialize(title, author, id = nil)
    @title = title
    @author = author
    @id = id || Random.rand(1...100_000)
    @rentals = []
  end

  def add_rental(person, date)
    Rental.new(date, person, self)
  end

  # List all books.
  def self.list_books(books)
    if books.empty?
      puts 'There are not books at the moment.'
    else
      books.each_with_index { |book, idx| puts "#{idx}) Title: \"#{book.title}\", Author: #{book.author}" }
    end
  end

  # Create a book
  def self.create_book(books)
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
    books << Book.new(title, author)
    print "Book created successfully\n"
  end
end
