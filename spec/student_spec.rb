require_relative '../student'
require_relative '../classroom'

describe Student do
    context 'When testing the Student class' do 

        it 'A Student is also a Person (inheritance)' do
            student = Student.new(24, 'John Doe')
            expect(student).to be_kind_of(Person)
        end

        it 'A Student has a classroom property of type Classroom' do 
            student = Student.new(24, 'Classroom1', 'John Doe', false)
            expect(student.classroom).to be_a(Classroom)
        end
    end
end