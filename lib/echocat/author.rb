require 'echocat/search'
module Echocat
	class Author

    class << self
      attr_accessor :all

      def all
        @all ||= []
      end
    end

    attr_accessor :email, :firstname, :lastname

    def initialize(attributes)
      @email = email
      @firstname = firstname
      @lastname = lastname

      Author.all << self
    end
  end
end
