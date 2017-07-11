# Implement the following code in Ruby: Create a module called HelperMethods that include a method called titleize that does the following: it takes in a string and returns the string back after capitalizing each word in that string. For example, if you pass to the method a string "hello world" you should get back "Hello World". The methods should not capitalize the following words: in, the, of, and, or, from. Then write a piece of code to demonstrate the difference between include and extend in using Ruby modules with classes to include methods. Make sure to demonstrate calling the titleize methods with your code.

module HelperMethods
  def titalize(string)
    exclusion = ['in','the','of','and','or','from']


    titalized = string.split.map(&:capitalize)
    titalized.each_with_index do |x,v|
      if exclusion.include?(x.downcase)
        titalized[v] = x.downcase
      end

    end
    return titalized.join(" ")

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


cat = Animal.new("these should not be capitalized - in the of and or from")
cat.capitalized
