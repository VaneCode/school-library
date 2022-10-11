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
    return [] unless File.exist?(path)

    books_file = File.open(path)
    JSON.parse(books_file.read).each { |book| books << Book.new(book['title'], book['author'], book['id']) }
    books_file.close
  end

  # Write books

  # Handle person.json file

  # Read people

  # Write people

  # Handle rentals.json file

  # Read rentals

  # Write rentals
end
