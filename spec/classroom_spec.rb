require_relative '../classroom'
require_relative '../student'

describe Classroom do
  before :each do
    @classroom = Classroom.new('Class1')
  end
  it 'Should be an object instance of Classroom' do
    expect(@classroom).to be_an_instance_of Classroom
  end

  it 'Method getter for label has to return Class1' do
    expect(@classroom.label).to eq 'Class1'
  end

  it 'Classroom has to have an empty array of students' do
    expect(@classroom.students).to eq []
  end

  it 'Method add_student has to add a new element in students array' do
    @student = Student.new('university', 21, 'Alpha', parent_permission: true)
    @classroom.add_student(@student)
    expect(@classroom.students).to have_attributes(size: 1)
  end
end
