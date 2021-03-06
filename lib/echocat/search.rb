module Echocat
  class Search
    class << self
      attr_accessor :all
      attr_reader :sort_by_title

      def all
        @all ||= []
      end

      def find_by_isbn(isbn)
        find_by('isbn', isbn)
      end

      def find_by_author(email)
        find_by('authors', email)
      end

      def sort_by_title
        sorted_by_title = @all.sort_by(&:title)
        puts print_table(sorted_by_title)
      end

      def display_all
        puts print_table(all)
      end

      def print_table(records)
      reutnr nil if records.blank?
        table = Terminal::Table.new(headings: ['Class', 'Title', 'ISBN', 'Authors', 'Description', 'Published At'])
        records.each do |r|
          table << [r.class.to_s.split('::').last, r.title, r.isbn, r.authors, r.description, r.publishedAt]
        end

        puts table
      end

      def find_by(search_key, search_val)
        selected_records = if @all.length
          @all.select { |key, val| key[search_key.to_sym] == search_val }
        else
          []
        end
        puts print_table(selected_records)
      end
    end
  end
end
