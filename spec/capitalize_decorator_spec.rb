require_relative '../capitalize_decorator'

describe CapitalizeDecorator do
  it 'Should capitalize the first letter of the name' do
    person = double('person')
    allow(person).to receive(:correct_name) { 'maximillianus' }

    capitalize = CapitalizeDecorator.new(person)
    expect(capitalize.correct_name).to eq 'Maximillianus'
  end
end
