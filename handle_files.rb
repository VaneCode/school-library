require_relative 'book'
require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'
require 'json'

class HandleFiles
  DATA_DIRECTORY = './data/'.freeze
  # Handle books.json file

  # Read books
  def self.read_books(books)
    path = "#{DATA_DIRECTORY}books.json"
    return unless File.exist?(path)

    books_file = File.open(path)
    JSON.parse(books_file.read).each { |book| books << Book.new(book['title'], book['author'], book['id']) }
    books_file.close
  end

  # Write books
  def self.write_books(books)
    return if books.empty?

    path_file = "#{DATA_DIRECTORY}books.json"
    data_books = books.map do |book|
      { title: book.title, author: book.author, id: book.id }
    end
    File.write(path_file, JSON.pretty_generate(data_books))
  end

  # Handle person.json file

  # Auxiliary methods
  def self.person_to_json(person)
    if person.instance_of?(Student)
      { class: person.class, id: person.id, name: person.name,
        age: person.age, classroom: person.classroom, parent_permission: person.parent_permission }
    else
      { class: person.class, id: person.id, name: person.name,
        age: person.age, specialization: person.specialization,
        parent_permission: person.parent_permission }
    end
  end

  def self.person_to_object(person)
    case person['class']
    when 'Student'
      Student.new(person['classroom'], person['age'], person['name'],
                  person['id'], parent_permission: person['parent_permission'])
    when 'Teacher'
      Teacher.new(person['specialization'], person['age'], person['name'], person['id'])
    end
  end

  # Read people
  def self.read_people(people)
    path = "#{DATA_DIRECTORY}people.json"
    return unless File.exist?(path)

    people_file = File.open(path)
    JSON.parse(people_file.read).each { |person| people << person_to_object(person) }
    people_file.close
  end

  # Write people
  def self.write_people(people)
    return if people.empty?

    path_file = "#{DATA_DIRECTORY}people.json"
    data_people = people.map do |person|
      person_to_json(person)
    end
    File.write(path_file, JSON.pretty_generate(data_people))
  end

  # Handle rentals.json file
  def self.rental_to_object(rental)
    person = person_to_object(rental['person'])
    book = rental['book']
    book_obj = Book.new(book['title'], book['author'], book['id'])
    puts book_obj.title
    Rental.new(rental['date'], person, book_obj)
  end

  def self.rental_to_json(rental)
    {
      date: rental.date,
      person: person_to_json(rental.person),
      book: { title: rental.book.title, author: rental.book.author, id: rental.book.id }
    }
  end

  # Read rentals
  def self.read_rental(rentals)
    path = "#{DATA_DIRECTORY}rentals.json"
    return unless File.exist?(path)

    rentals_file = File.open(path)
    JSON.parse(rentals_file.read).each do |rental|
      rentals << rental_to_object(rental)
    end
    rentals_file.close
  end

  # Write rentals
  def self.write_rentals(rentals)
    return if rentals.empty?

    path_file = "#{DATA_DIRECTORY}rentals.json"
    data_rentals = rentals.map do |rental|
      rental_to_json(rental)
    end
    File.write(path_file, JSON.pretty_generate(data_rentals))
  end
end
