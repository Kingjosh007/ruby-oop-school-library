require_relative '../person'

describe Person do
  context 'When testing the Person class' do
    it 'A person created with only one parameter has a name property set to "Unknown"' do
      person = Person.new(24)
      expect(person.name).to eq('Unknown')
    end

    it 'A person created with only two parameters has a parent_permission property set to true' do
      person = Person.new(54, 'John Doe')
      expect(person.parent_permission).to be true
    end
  end
end
