require_relative '../book'

describe Book do
  before :each do
    @book = Book.new('title1', 'author1')
  end
  it 'should be able to create book object' do
    expect(@book.title).to eq 'title1'
    expect(@book.author).to eq 'author1'
  end

  it 'should be an object instance of Book' do
    expect(@book).to be_an_instance_of Book
  end
end
