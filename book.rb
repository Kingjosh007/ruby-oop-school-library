require_relative 'rental'
require_relative 'data_related'

# rubocop: disable Style/ClassVars

class Book
  @@books = []
  @@books_filename = 'books.json'

  attr_accessor :title, :author, :rentals, :books

  def initialize(title, author, rentals = [])
    @title = title
    @author = author
    @rentals = rentals
  end

  def self.overwrite_books(arr)
    @@books = arr
  end
end

# rubocop: enable Style/ClassVars
