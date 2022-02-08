require 'json'
require 'book'
require 'person'
require 'student'
require 'teacher'
require 'rental'

books_filename = 'data/books.json'
rentals_filename = 'data/rentals.json'
people_filename = 'data/people.json'

def object_to_hash(obj)
    obj.instance_variables.each_with_object({}) do |var, hash|
      key = var.to_s.delete('@')
      value = obj.instance_variable_get(var)
      if ['Book', 'Rental', 'Person', 'Student', 'Teacher'].include?(obj.class.name)
        value = object_to_hash(value)
      end
      if obj.class.name == 'Student'
        hash['type'] = 'Student'
      elsif obj.class.name == 'Teacher'
        hash['type'] = 'Teacher'
      end
      hash[key] = value
    end
else


def hash_to_object(hash, classname)
  case classname
  when 'Book'
    Book.new(hash['title'], hash['author'], hash['rentals'])
  when 'Rental'
    Rental.new(hash['date'], hash['book'], hash['person'])
  when 'Student'
    stud = Student.new(hash['age'], hash_to_object(hash['classroom']), hash['name'], hash['parent_permission'])
    stud.id = hash['id']
    stud.rentals = hash_to_object(hash['rentals'])
    stud
  when 'Teacher'
    teach = Teacher.new(hash['age'], hash['specialization'], hash['name'], hash['parent_permission'])
    teach.id = hash['id']
    teach.rentals = hash_to_object(hash['rentals'])
    teach 
  end
end

def save_data(filename, data)
    File.open(filename, 'w') do |file|
        file.puts JSON.parse(data)
    end
end

def read_data(filename)
    File.read(filename) || '[]'
end