# frozen_string_literal: true
require_relative '../bin/load_authors'
require_relative '../bin/load_books'

module Echocat
  def self.run
    puts 'printing authors, with their books & magazines'
    authors = LoadAuthors.new.authors
    authors.each do |author|
      puts "Author's Info:"
      puts "Email: #{author.email}"
      puts "Firstname: #{author.firstname}"
      puts "Lastname: #{author.lastname}"

      puts '-------------------------------------'

      puts "Books published by #{author.full_name}:"
      author.books.each do |book|
        puts "Title: #{book.title}"
        puts "Isbn: #{book.isbn}"
        puts "Description: #{book.description}"
        puts '_________________________________'
      end

      puts '-------------------------------------'

      puts "Magazines published by #{author.full_name}:"
      author.magazines.each do |magazine|
        puts "Title: #{magazine.title}"
        puts "Isbn: #{magazine.isbn}"
        puts "Published At: #{magazine.published_at}"
        puts '_________________________________'
      end
    end

    puts '*********************************************'
    book = LoadBooks.new.find_by(isbn: '3214-5698-7412')
    puts 'Book found by ISBN'
    puts "Title: #{book.title}"
    puts "Description: #{book.description}"
    puts '*********************************************'

    puts '=============================================='

    puts 'Books & Magazine by author email'
    author1 = LoadAuthors.new.find_by(email: 'null-walter@echocat.org')
    puts "Author's Info:"
    puts "Email: #{author1.email}"
    puts "Firstname: #{author1.full_name}"

    puts '-------------------------------------'

    puts "Books published by #{author1.full_name}:"
    author1.books.each do |book|
      puts "Title: #{book.title}"
      puts '_________________________________'
    end

    puts '-------------------------------------'

    puts "Magazines published by #{author1.full_name}:"
    author1.magazines.each do |magazine|
      puts "Title: #{magazine.title}"
      puts '_________________________________'
    end

    puts '=============================================='
  end
end
