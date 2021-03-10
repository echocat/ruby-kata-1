# frozen_string_literal: true

# :Magazine Class for defining the magazine attributes and methods:
class Magazine
  def initialize(title:, isbn:, author:, published_at:)
    @title = title
    @isbn = isbn
    @author = author
    @description = published_at
  end
end
