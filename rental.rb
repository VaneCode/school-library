require './book'
require './person'
class Rental
  attr_accessor :date
  attr_reader :person, :book

  def initialize(date, person, book)
    @date = date

    @person = person
    person.rentals << self

    @book = book
    book.rentals << self
  end

  # Create rental
  def self.create_rental(books, people)
    idx_book = nil
    idx_person = nil
    until (0..books.length - 1).include? idx_book
      puts 'Select a book from the following list by number'
      Book.list_books(books)
      idx_book = gets.chomp.to_i
    end
    until (0..people.length - 1).include? idx_person
      puts 'Select a person from the following list by number (not id)'
      Person.list_people(people)
      idx_person = gets.chomp.to_i
    end
    print 'Date: '
    date = gets.chomp
    Rental.new(date, people[idx_person], books[idx_book])
  end

  def self.rental_control(books, people, rentals)
    if people.empty? && books.empty?
      puts 'There are no people and books registered to make the rental'
    elsif books.empty?
      puts 'There are no registered books to rental'
    elsif people.empty?
      puts 'There are no registered people to make the rental'
    else
      rentals << create_rental(books, people)
      print "Rental created successfully\n"
    end
  end

  # List all rentals for a given person id.
  def self.show_rentals(people, rentals)
    print 'ID of person: '
    id = gets.chomp.to_i
    person = nil
    people.each { |p| person = p if p.id == id }
    if person.nil?
      puts "There is not person with the id #{id} registered"
    elsif person.rentals.length.zero?
      puts "Person #{id}: #{person.name} doesn't have rentals"
    else
      puts 'Rentals:'
      rentals.each do |rental|
        puts "Date: #{rental.date}, Book: \"#{rental.book.title}\" by #{rental.book.author}" if rental.person.id == id
      end
    end
  end

  def self.rentals_by_person_id(people, rentals)
    if rentals.empty?
      puts 'There are not rentals registered'
    else
      show_rentals(people, rentals)
    end
  end
end
