require_relative '../book'

describe Book do
  context 'When testing the Book class' do
    it 'A newly created book has a title of type String' do
      bk = Book.new('The Hobbit', 'J.R.R. Tolkien', [])
      expect(bk.title).not_to be_nil
      expect(bk.title).to be_a(String)
    end

    it 'A newly created book has an author of type String' do
      bk = Book.new('The Hobbit', 'J.R.R. Tolkien', [])
      expect(bk.author).not_to be_nil
      expect(bk.author).to be_a(String)
    end

    it 'A newly created book has a rentals property of type Array' do
      bk = Book.new('The Hobbit', 'J.R.R. Tolkien', [])
      expect(bk.rentals).not_to be_nil
      expect(bk.rentals).to be_a(Array)
    end

    it 'The rentals property of a book is an Array of objects from class Rental' do
      bk = Book.new('The Hobbit', 'J.R.R. Tolkien', [])
      bk2 = Book.new('Book1', 'Title1', %w[Rental1 Rental2])

      expect(bk.rentals).to all(be_a(Rental))
      expect(bk2.rentals.all? { |rental| rental.is_a?(Rental) }).to be false
    end
  end
end
