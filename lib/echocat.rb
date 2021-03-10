# frozen_string_literal: true

require_relative '../app/csv_reader'

# :Just a simple module for printing the hello world:
module Echocat

  AUTHORS_CSV_FILE_PATH = 'data/authors.csv'
  BOOKS_CSV_FILE_PATH = 'data/books.csv'
  MAGAZINES_CSV_FILE_PATH = 'data/magazines.csv'

  def self.authors
    authors_file_path = AUTHORS_CSV_FILE_PATH
    books_file_path = BOOKS_CSV_FILE_PATH
    magazines_file_path = MAGAZINES_CSV_FILE_PATH
    CsvReader.read_files(authors_file_path, books_file_path, magazines_file_path)
  end

  def self.author_books
    array_of_authors.map(&:books)
  end

  def self.author_magazines
    array_of_authors.map(&:magazines)
  end

  def self.array_of_authors
    authors
  end
end
