require_relative '../person'
require_relative '../book'
require_relative '../rental'

describe Person do
  before :each do
    @book = Book.new('title1', 'author1')
    @person = Person.new(23)
    @rental = Rental.new('2020-10-10', @person, @book)
  end

  it 'Create a new rental with a date, book and person' do
    expect(@rental).to have_attributes(date: '2020-10-10')
  end

  it 'Should be an object instance of Rental' do
    expect(@rental).to be_an_instance_of Rental
  end
end
