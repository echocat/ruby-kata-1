# frozen_string_literal: true
lib = File.expand_path('..', __FILE__ )
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'terminal-table'
require 'echocat/options'
require 'echocat/data_importer'
module Echocat
  def self.run
    Echocat::DataImporter.new.from_csv
   	Echocat::Options.call
  end
end
