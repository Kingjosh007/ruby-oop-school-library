require_relative '../teacher'

describe Teacher do
  context 'When testing the Teacher class' do
    it 'A Teacher is also a Person (inheritance)' do
      teacher = Teacher.new(40, 'Web Development', 'Paul Parker')
      expect(teacher).to be_kind_of(Person)
    end

    it 'A Teacher can always use services' do
      teacher1 = Teacher.new(40, 'Web Development', 'Paul Parker')
      teacher2 = Teacher.new(44, 'Ruby', 'Tim Apollo')
      teacher3 = Teacher.new(17, 'Whatever', 'Apollo Timothy')
      teach_array = [teacher1, teacher2, teacher3]

      expect(teach_array.all?(&:can_use_services?)).to be true
    end
  end
end
