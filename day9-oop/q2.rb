class Book
  # include HelperMethods
  attr_accessor :title
  attr_accessor :chapters
  def initialize(title,chapters = [])
    @title = title
    @chapters = chapters
  end

  def add_chapter
    chapters.each do |x| puts x
  end
end


shantaram1 = Book.new("shantaram")

p shantaram1.title
p shantaram1.chapters
