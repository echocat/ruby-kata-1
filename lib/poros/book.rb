class Book
  attr_accessor :title, :isbn, :authors, :description

  def initialize(title, isbn, description)
    @title = title
    @isbn = isbn
    @description = description
    @authors = []
  end
end
