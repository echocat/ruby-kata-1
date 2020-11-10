# frozen_string_literal: true
require 'tabulo'
module Echocat
  class Publication
    class << self
      attr_accessor :all, :selected
      attr_reader :sort_by_title

      def all
        @all ||= []
      end

      def display_all
        puts tabled_output(all)
      end

      def sort_by_title
        @sorted_by_title = @all.sort_by! { |publication| publication[:title] }
        puts tabled_output(@sorted_by_title)
      end

      def find_by_isbn(isbn)
        @selected = @all.select!{ |key, _value| key[:isbn] == isbn }
        puts tabled_output(@selected)
      end

      def find_by_author(email)
        selected = @all.select! { |key, _value| key[:authors].include?(email) }
        puts tabled_output(selected)
      end

      def tabled_output(collection)
        Tabulo::Table.new(collection,
                          :type,
                          :isbn,
                          :title,
                          :authors,
                          :description,
                          :published_at,
                          row_divider_frequency: 1)
            .pack
      end
    end
  end
end
