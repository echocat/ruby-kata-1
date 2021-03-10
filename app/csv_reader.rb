# frozen_string_literal: true

require 'csv'
require_relative '../app/author'
require_relative '../app/book'
require_relative '../app/magazine'

# :File to read the CSV content and return the result:
class CsvReader
  def self.read_files(authors_file_path, books_file_path, magazines_file_path)
    authors_data = CSV.parse(File.read(authors_file_path), headers: true, col_sep: ';')
    books_data = CSV.parse(File.read(books_file_path), headers: true, col_sep: ';')
    magazines_data = CSV.parse(File.read(magazines_file_path), headers: true, col_sep: ';')
    create_objects(authors_data, books_data, magazines_data)
  end

  def self.create_objects(authors_data, books_data, magazines_data)
    create_authors_with_books_and_magazines(authors_data, books_data, magazines_data)
  end

  def self.create_authors_with_books_and_magazines(authors_data, books_data, magazines_data)
    authors = []
    authors_data.each do |author_object|
      author = create_author(author_object)
      create_author_books(author, books_data)
      create_author_magazines(author, magazines_data)
      authors.push(author)
    end
    authors
  end

  def self.create_author(author_object)
    Author.new(email: author_object[0], first_name: author_object[1],
               last_name: author_object[2])
  end

  def self.create_author_books(author, books_data)
    books_data.each do |book_object|
      book_object[2].split(',').each do |author_email|
        next unless author.email == author_email

        author.add_books(title: book_object[0], isbn: book_object[1],
                         author: author.email, description: book_object[3])
      end
    end
  end

  def self.create_author_magazines(author, magazines_data)
    magazines_data.each do |magazine_object|
      magazine_object[2].split(',').each do |author_email|
        next unless author.email == author_email

        author.add_magazines(title: magazine_object[0], isbn: magazine_object[1],
                             author: author.email, published_at: magazine_object[3])
      end
    end
  end
end
