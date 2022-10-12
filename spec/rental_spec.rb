require_relative '../person'
require_relative '../book'
require_relative '../rental'

describe Person do
  it 'create a new rental with a date, book and person' do
    book = Book.new('title1', 'author1')
    person = Person.new(23)
    rental = Rental.new('2020-10-10', person, book)
    expect(rental).to have_attributes(date: '2020-10-10')
  end
end
