# frozen_string_literal: true
# encoding: UTF-8

require 'csv'
require 'json'

module Echocat
  def self.run
    csv_file_paths = [
      '/workspaces/ruby-kata-1/data/authors.csv', 
      '/workspaces/ruby-kata-1/data/books.csv', 
      '/workspaces/ruby-kata-1/data/magazines.csv'
    ]

    convert_and_create_json_files(csv_file_paths)
  end


  def self.convert_and_create_json_files(csv_file_paths)
    csv_file_paths.each do |csv_file_path|
      csv_data = CSV.read(csv_file_path, headers: true, col_sep: ';', encoding: 'bom|utf-8')

      json_data = csv_data.map { |row| row.to_h }

      json_file_path = csv_file_path.sub('.csv', '.json')
      
      File.open(json_file_path, 'w') do |file|
        file.puts JSON.pretty_generate(json_data)
      end
    end
  end

end
