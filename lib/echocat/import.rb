# frozen_string_literal: true

require 'csv'
require 'echocat/book'
require 'echocat/magazine'
module Echocat
  class ImportFromCsv
    def self.import_all_data
      books
      magazines
    end

    def self.books
      books_csv = File.join(File.expand_path('../../data', __dir__), 'books.csv')
      CSV.foreach(books_csv, col_sep: ',', headers: true) do |row|
        params = {
          title: row['title'],
          description: row['description'],
          authors: row['authors'].split(',').join(', '),
          isbn: row['isbn'],
          type: 'Book'
        }
        Echocat::Book.new(params)
      end
    end

    def self.magazines
      magazines_csv = File.join(File.expand_path('../../data', __dir__), 'magazines.csv')
      CSV.foreach(magazines_csv, col_sep: ',', headers: true) do |row|
        params = {
            title: row['title'],
            description: row['description'],
            authors: row['authors'].split(',').join(', '),
            isbn: row['isbn'],
            published_at: row['publishedAt'],
            type: 'Magazine'
        }
        Echocat::Magazine.new(params)
      end
    end
  end
end
