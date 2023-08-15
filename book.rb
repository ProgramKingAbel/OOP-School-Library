require 'json'
class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(rental)
    @rentals << rental
    rental
  end
end

def self.save_books_to_json(books)
  books_data = books.map(&:to_hash)
  File.write('books.json', JSON.pretty_generate(books_data))
end

def self.load_books_from_json
  books_data = JSON.parse(File.read('books.json'))
  books_data.map { |data| Book.new(data['title'], data['author']) }
end

def to_hash
  {
    'title' => @title,
    'author' => @author,
    'rentals' => @rentals.map { |rental| { 'date' => rental.date } }
  }
end