require 'echocat/book'
require 'echocat/author'
require 'echocat/magazine'
require 'echocat/search'
require 'echocat/data_importer'
module Echocat
  class Options
    OPTIONS = {
      '0': {
        name: 'Exit',
        action: 'exit(1)',
        class: ''
      },
      '1': {
        name: 'Display all',
        action: 'display_all',
        class: 'Echocat::Search'
      },
      '2': {
        name: 'Sort by title',
        action: 'sort_by_title',
        class: 'Echocat::Search'
      },
      '3': {
        name: 'Find by ISBN',
        action: 'find_by_isbn',
        class: ''
      },
      '4': {
        name: 'Find all by authors',
        action: 'find_by_author',
        class: ''
      }
    }

    attr_accessor :selected_option

    def self.call
      new.display_options
    end

    def display_options
      print_header("Available options")
      OPTIONS.each do |key, val|
        puts "#{key} - #{val[:name]}"
      end
      print 'Select: '
      select_option
    end

    def select_option
      @selected_option = $stdin.gets.chomp

      selected_option
    end

    def selected_option
      return no_option_message unless OPTIONS.keys.include?(:"#{@selected_option}")

      selected_option = OPTIONS[:"#{@selected_option}"]
      exit(1) if selected_option[:name] == 'Exit'

      print_header("You selected to: #{selected_option[:name]}")

      if selected_option[:class].empty?
        puts eval(selected_option[:action])
      else
        Echocat::DataImporter.new.from_csv
        Echocat::Search.send(selected_option[:action].to_sym)
      end

      display_options unless selected_option[:action] == 'find_by_isbn' || selected_option[:action] == 'find_by_author'
    end

    def find_by_isbn
      search_by_params('find_by_isbn', 'Enter ISBN: ')
    end

    def find_by_author
      search_by_params('find_by_author', 'Enter Author Email: ')
    end

    def no_option_message
      print_header("You insert incorrect option.")
      display_options
    end

    def search_by_params(method, printed_label)
      print printed_label
      input_text = $stdin.gets.chomp
      Echocat::Search.send(method.to_sym, input_text)
      display_options
    end

    def divider
      '========================================'
    end

    def print_header(header_text)
      divider
      puts header_text
      divider + "\n"
    end
  end
end
