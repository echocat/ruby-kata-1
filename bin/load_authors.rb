# frozen_string_literal: true

require 'csv'
require_relative '../lib/poros/author'
require_relative '../lib/poros/book'
require_relative '../lib/poros/magazine'

class LoadAuthors
  attr_reader :authors

  def initialize
    @authors = []
    load_author_with_details
  end

  def find_by(email:)
    authors.select { |author| author.email == email }.first
  end

  private

  def load_author_with_details
    authors_from_csv = CSV.read('data/authors.csv', headers: true, col_sep: ';')
    authors_from_csv.each do |author|
      author = create_author_object(author)
      author.books = load_books_for(author: author)
      author.magazines = load_magazines_for(author: author)
      authors << author
    end
    authors
  end

  def create_author_object(author)
    Author.new(author[0], author['firstname'], author['lastname'])
  end

  def load_books_for(author:)
    books = CSV.read('data/books.csv', headers: true, col_sep: ';')

    book_objects = []
    books.each do |book|
      book_objects << create_book_object(book) if book['authors'].include?(author.email)
    end

    book_objects
  end

  def load_magazines_for(author:)
    magazines = CSV.read('data/magazines.csv', headers: true, col_sep: ';')

    magazines_objects = []
    magazines.each do |magazine|
      magazines_objects << create_magazine_object(magazine) if magazine['authors'].include?(author.email)
    end

    magazines_objects
  end

  def create_book_object(book)
    Book.new(book[0], book['isbn'], book['description'])
  end

  def create_magazine_object(magazine)
    Magazine.new(magazine[0], magazine['isbn'], magazine['publishedAt'])
  end
end
