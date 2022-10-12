require_relative '../teacher'

describe Teacher do
  it 'should be able to create a teacher' do
    teacher = Teacher.new('Computer science', 40, 'Alpha')
    expect(teacher.specialization).to eq 'Computer science'
    expect(teacher.age).to eq 40
  end

  it 'should be an object instance of Teacher' do
    teacher = Teacher.new('Computer science', 40, 'Alpha')
    expect(teacher).to be_an_instance_of Teacher
  end
end
