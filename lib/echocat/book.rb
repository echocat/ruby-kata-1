require 'echocat/search'
module Echocat
  class Book

    class << self
      attr_accessor :all

      def all
        @all ||= []
      end
    end

    attr_accessor :title, :isbn, :authors, :description

    def initialize(attributes)
      @title = attributes[:title]
      @isbn = attributes[:isbn]
      @authors = attributes[:authors]
      @description = attributes[:description]

      Book.all << self
      Echocat::Search.all << self
    end

    def publishedAt
      ''
    end
  end
end
