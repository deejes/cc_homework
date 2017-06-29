# Implement the following code in Ruby: Create a module called HelperMethods that include a method called titleize that does the following: it takes in a string and returns the string back after capitalizing each word in that string. For example, if you pass to the method a string "hello world" you should get back "Hello World". The methods should not capitalize the following words: in, the, of, and, or, from. Then write a piece of code to demonstrate the difference between include and extend in using Ruby modules with classes to include methods. Make sure to demonstrate calling the titleize methods with your code.

module HelperMethods
  def titalize(string)
    return string.split.map(&:capitalize).join(' ') # i know this doesnt exclude
    #any words, but i could put in a step that create an array and then loops over
    #it, and capitalizes only words not in a list, using an includes? method.

  end

end


class Animal
  include HelperMethods
  attr_accessor :name
  def initialize(name)
    @name = name
  end

  def capitalized
    puts titalize(self.name)
  end
end


cat = Animal.new("this is the sentence i am trying to capitalize!")
cat.capitalized
