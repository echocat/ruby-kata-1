# frozen_string_literal: true

# :Author Class for defining author attributes and methods:
class Author

  attr_reader :email, :first_name, :last_name, :books, :magazines

  def initialize(email:, first_name:, last_name:)
    @email = email
    @first_name = first_name
    @last_name = last_name
    @books = []
    @magazines = []
  end

  def add_books(title:, isbn:, author:, description:)
    new_book = Book.new(title: title, isbn: isbn, author: self, description: description)
    books.push(new_book)
    new_book
  end

  def add_magazines(title:, isbn:, author:, published_at:)
    new_magazine = Magazine.new(title: title, isbn: isbn, author: self, published_at: published_at)
    magazines.push(new_magazine)
    new_magazine
  end
end
