class Anagram
  attr_reader :word, :letters
  
  def initialize(word)
    @word = word.downcase
    @letters = @word.chars.sort
  end

  def match(words_array)
    words_array.select { |string| string.downcase.chars.sort == letters && string.downcase != word }
  end

end

detector = Anagram.new('listen')

p detector.match(%w(enlists google inlets banana))
