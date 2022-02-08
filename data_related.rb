require 'json'
require 'book'
require 'rental'

def object_to_hash(obj)
    obj.instance_variables.each_with_object({}) do |var, hash|
      key = var.to_s.delete('@')
      value = obj.instance_variable_get(var)
      if ['Book', 'Rental', 'Person', 'Student', 'Teacher'].include?(obj.class.name)
        value = object_to_hash(value)
      end
      hash[key] = value
      hash
    end
else


def hash_to_object(hash, classname)
  case classname
  when 'Book'
    Book.new(hash['title'], hash['author'], hash['rentals'])
  when 'Rental'
    Rental.new(hash['date'], hash['book'], hash['person'])
end

def save_data(filename, data)
    File.open(filename, 'w') do |file|
        file.puts JSON.parse(data)
    end
end

def read_data(filename)
    File.read(filename)
end