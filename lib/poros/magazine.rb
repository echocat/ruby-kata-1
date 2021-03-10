class Magazine
  attr_accessor :title, :isbn, :authors, :published_at

  def initialize(title, isbn, published_at)
    @title = title
    @isbn = isbn
    @published_at = published_at
    @authors = []
  end
end
