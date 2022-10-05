require './app'

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

def run_choice(choice, app)
  case choice
  when 1
    app.list_books
  when 2
    app.list_people
  when 3
    app.create_person
  when 4
    app.create_book
  when 5
    app.rental_control
  when 6
    app.rentals_by_person_id
  else
    puts 'Bye ;)'
  end
end

def main
  app = App.new
  user_choice = 0
  puts "\nWelcome to School Library App!"
  while user_choice != 7
    list_options
    user_choice = gets.chomp.to_i
    run_choice(user_choice, app)
  end
end

main
