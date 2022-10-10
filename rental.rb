require './book'
require './people'
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
  def create_rental(books, people)
    idx_book = nil
    idx_person = nil
    until (0..book.length - 1).include? idx_book
      puts 'Select a book from the following list by number'
      Book.list_books
      idx_book = gets.chomp.to_i
    end
    until (0..@people.length - 1).include? idx_person
      puts 'Select a person from the following list by number (not id)'
      Person.list_people
      idx_person = gets.chomp.to_i
    end
    print 'Date: '
    date = gets.chomp
    Rental.new(date, people[idx_person], books[idx_book])
    print "Rental created successfully\n"
  end

  def self.rental_control(books, people)
    if books.length.zero?
      puts 'There are not books for rental'
    elsif people.length.zero?
      puts 'There are no registered people to make the rental'
    elsif people.length.zero? && books.length.zero?
      puts 'There are no people and books registered to make the rental'
    else
      create_rental(books, people)
    end
  end

  # List all rentals for a given person id.
  def show_rentals(people)
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
      person.rentals.each do |rental|
        puts "Date: #{rental.date}, Book: \"#{rental.book.title}\" by #{rental.book.author}"
      end
    end
  end

  def self.rentals_by_person_id(people, rentals)
    if rentals.length.zero?
      puts 'There are not rentals registered'
    else
      show_rentals(people)
    end
  end
end
