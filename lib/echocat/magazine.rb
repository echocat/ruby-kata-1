# frozen_string_literal: true

require 'dry-types'
module Echocat
  class Magazine < Dry::Struct
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
    attribute :isbn, Types::String
    attribute :authors, Types::String
    attribute :published_at, Types::String
    attribute :type, Types::String

    def initialize(attributes)
      super(attributes)
      Magazine.all << self
      Publication.all << self
    end

    def description
      'NULL'
    end
  end
end
