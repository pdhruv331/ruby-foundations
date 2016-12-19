# Calculates sum of multiples.
class SumOfMultiples
  attr_reader :multiples
  def initialize(*multiples)
    @multiples = multiples.empty? ? [3, 5] : multiples
  end

  def self.to(max)
    SumOfMultiples.new.to(max)
  end

  def multiple_of(number)
    multiples.any? { |multiple| (number % multiple).zero? }
  end

  def to(max)
    (0...max).to_a.select { |number| multiple_of(number) }.reduce(:+)
  end
end
