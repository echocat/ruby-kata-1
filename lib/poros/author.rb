class Author
  attr_accessor :email, :firstname, :lastname, :books, :magazines

  def initialize(email, firstname, lastname)
    @email = email
    @firstname = firstname
    @lastname = lastname
    @books = []
    @magazines = []
  end

  def full_name
    "#{firstname} #{lastname}"
  end
end
