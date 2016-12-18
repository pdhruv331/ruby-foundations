class Series
  attr_reader :digits, :possible_series
  def initialize(digits)
    @digits = digits.chars.map(&:to_i)
    @possible_series = []
  end

  def slices(num)
    raise ArgumentError if num > size
    @digits.each_with_index do |number, index|
      limit = index + (num - 1)
      possible_series << @digits[index..limit] if limit < size
    end
    possible_series
  end

  def size
    @digits.size
  end
end

series = Series.new('01234')

p series.slices(1)