require_relative 'rental'

class Book
  @@books = []
  attr_accessor :title, :author, :rentals

  def initialize(title, author, rentals = [])
    @title = title
    @author = author
    @rentals = rentals
  end
end
