# frozen_string_literal: true

require 'dry-types'
module Echocat
  class Book < Dry::Struct
    module Types
      include Dry.Types()
    end

    class << self
      attr_accessor :all

      def all
        @all ||= []
      end
    end

    attribute :title, Types::String
    attribute :description, Types::String
    attribute :isbn, Types::String
    attribute :authors, Types::String
    attribute :type, Types::String

    def initialize(attributes)
      super(attributes)
      Book.all << self
      Publication.all << self
    end

    def published_at
      'NULL'
    end
  end
end
