# frozen_string_literal: true
lib = File.expand_path('..', __FILE__ )
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'dry-struct'
require 'echocat/menu'
require 'echocat/import'
module Echocat
  def self.run
    ImportFromCsv.import_all_data
    Menu.call
  end
end

Echocat.run
