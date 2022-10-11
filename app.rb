require './book'
require './teacher'
require './student'
require './rental'
require_relative 'handle_files'
class App
  attr_reader :rentals, :books, :people

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  # List user options
  def list_options
    puts 'Please choose an option by entering a number: '
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end

  def save_data
    HandleFiles.write_books(@books)
  end

  def run_choice(choice)
    case choice
    when 1 then Book.list_books(@books)
    when 2 then Person.list_people(@people)
    when 3 then Person.create_person(@people)
    when 4 then Book.create_book(@books)
    when 5 then Rental.rental_control(@books, @people, @rentals)
    when 6 then Rental.rentals_by_person_id(@people, @rentals)
    when 7
      puts 'Bye ;)'
      save_data
    else puts 'Invalid option, please choose a number between 1 and 7'
    end
  end

  def run_app
    # Read data from json files
    HandleFiles.read_books(@books)
    user_choice = 0
    puts "\nWelcome to School Library App!"
    while user_choice != 7
      list_options
      user_choice = gets.chomp.to_i
      run_choice(user_choice)
    end
  end
end
