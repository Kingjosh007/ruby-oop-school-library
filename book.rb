require_relative 'rental'

# rubocop: disable Style/ClassVars

class Book
  @@books_filename = 'books.json' 
  @@books = []
  attr_accessor :title, :author, :rentals

  def initialize(title, author, rentals = [])
    @title = title
    @author = author
    @rentals = rentals
  end
end

# rubocop: enable Style/ClassVars
