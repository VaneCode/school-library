require_relative '../student'

describe Student do
  before :each do
    @student = Student.new('university', 21, 'Alpha', parent_permission: true)
  end
  it 'should say "¯\(ツ)/¯" when we call the play_hooky method' do
    message = @student.play_hooky
    expect(message).to eql '¯\(ツ)/¯'
  end

  it 'should be able to create a student' do
    expect(@student.name).to eq 'Alpha'
    expect(@student.parent_permission).to eq true
    expect(@student.age).to eq 21
  end

  it 'should be an object instance of Student' do
    expect(@student).to be_an_instance_of Student
  end
end
