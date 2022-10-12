require_relative '../trimmer_decorator'

describe TrimmerDecorator do
  it 'should only display ten letter for name' do
    person = double('person')
    allow(person).to receive(:correct_name) { 'maximillianus' }

    trimmer = TrimmerDecorator.new(person)
    expect(trimmer.correct_name).to eq 'maximillia'
  end
end
