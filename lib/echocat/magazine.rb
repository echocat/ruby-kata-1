require 'echocat/search'
module Echocat
  class Magazine

    class << self
      attr_accessor :all

      def all
        @all ||= []
      end
    end

    attr_accessor :title, :isbn, :authors, :publishedAt

    def initialize(attributes)
      @title = attributes[:title]
      @isbn = attributes[:isbn]
      @authors = attributes[:authors]
      @publishedAt = attributes[:publishedAt]

      Magazine.all << self
      Search.all << self
    end

    def description
      ''
    end
  end
end
