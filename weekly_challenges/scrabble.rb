class Scrabble
  attr_reader :word
  VALUES = { 'aeioulnrst' => 1,
             'dg' => 2,
             'bcmp' => 3,
             'fhvwy' => 4,
             'k' => 5,
             'jx' => 8, 
             'qz' => 10 } 

  def initialize(word)
    @word = word
  end

  def score
    total = 0
    return 0 if word.nil?
    word.chars.each do |letter|
      VALUES.keys.each {|key| total += VALUES[key] if key.include?(letter.downcase)}
    end
    total
  end

  def self.score(string)
    Scrabble.new(string).score
  end

end

puts Scrabble.score('alacrity')