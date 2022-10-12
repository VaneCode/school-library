require_relative '../person'

describe Person do
  before :each do
    @person = Person.new(15, 'Vilma', parent_permission: false)
  end

  it 'Should be an object instance of Person' do
    expect(@person).to be_an_instance_of Person
  end

  it 'Method can_use_services? should return false' do
    permission = @person.can_use_services?
    expect(permission).to eql false
  end

  it 'Method getter for name should return Vilma' do
    expect(@person.name).to eq 'Vilma'
  end

  it 'Method getter for age should return 15' do
    expect(@person.age).to eq 15
  end
end
