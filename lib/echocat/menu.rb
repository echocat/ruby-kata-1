# frozen_string_literal: true

require 'echocat/hash'
require 'echocat/book'
require 'echocat/publication'
module Echocat
  class Menu
    OPTIONS = {
      '1': {
        name: 'Display all publications',
        action: 'Publication.display_all'
      },
      '2': {
        name: 'Sort publications by title',
        action: 'Publication.sort_by_title'
      },
      '3': {
        name: 'Find publication by ISBN',
        action: 'find_by_isbn'
      },
      '4': {
        name: 'Find all books and magazines by their authors',
        action: 'find_all_by_author'
      },
      '0': {
        name: 'Exit',
        action: 'exit(1)'
      }
    }

    attr_accessor :selected_option

    def self.call
      new.display_options
    end

    def display_options
      puts '----------------------------------------'
      puts 'Menu OPTIONS'
      puts '----------------------------------------'
      OPTIONS.except(:"#{@selected_option}").each do |key, value|
        puts "#{key} - #{value[:name]}"
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

      system('clear')
      puts '****************************************'
      puts "You selected to: #{selected_option[:name]}"
      print "****************************************\n"
      puts eval(selected_option[:action])
      puts '----------------------------------------'
      unless selected_option[:action] == 'find_by_isbn' || selected_option[:action] == 'find_all_by_author'
        display_options
      end
    end

    def find_by_isbn
      print 'Enter ISBN: '
      input = $stdin.gets.chomp
      Publication.find_by_isbn(input)
      display_options
    end

    def find_all_by_author
      print 'Enter Author Email: '
      input = $stdin.gets.chomp
      Publication.find_by_author(input)
      display_options
    end

    def no_option_message
      system('clear')
      puts '%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'
      puts 'This option does not exist.'
      puts '%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'
      display_options
    end
  end
end
