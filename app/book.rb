# frozen_string_literal: true

# :Book Class for defining the book attributes and methods:
class Book
  def initialize(title:, isbn:, author:, description:)
    @title = title
    @isbn = isbn
    @author = author
    @description = description
  end
end
