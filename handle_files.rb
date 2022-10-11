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
  def person_to_json(person)
    case person
    when person.instance_of?(Student)
      { class: person.class, id: person.id, name: person.name, age: person.age, classroom: person.classroom, parent_permission: person.parent_permission }
    when person.instance_of?(Teacher)
      { class: person.class, id: person.id, name: person.name, age: person.age, specialization: person.specialization, parent_permission: person.parent_permission }
    end
  end

  def person_to_object(person)
    case person
    when person['class'] = 'Student'
      Student.new(person['classroom'], person['age'], person['name'], person['id'], person['parent_permission'])
    when person['class'] = 'Teacher'
      Teacher.new(person['specialization'], person['age'], person['name'], person['id'])
    end
  end

  # Read people

  # Write people

  # Handle rentals.json file

  # Read rentals

  # Write rentals
end
