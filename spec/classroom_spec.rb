require_relative '../classroom'

describe Classroom do
  context 'When testing the Classroom class' do
    it 'It has a label and students' do
      classroom = Classroom.new('Math')
      expect(classroom.label).to eq 'Math'
    end

    it 'A newly created classroom has students property of type Array' do
      cl = Classroom.new('Math')
      expect(cl.students).not_to be_nil
      expect(cl.students).to be_a(Array)
    end
  end
end
