require_relative '../teacher'

describe Teacher do
  before :each do
    @teacher = Teacher.new('Computer science', 40, 'Alpha')
  end
  it 'should be able to create a teacher' do
    expect(@teacher.specialization).to eq 'Computer science'
    expect(@teacher.age).to eq 40
  end

  it 'should be an object instance of Teacher' do
    expect(@teacher).to be_an_instance_of Teacher
  end
end
