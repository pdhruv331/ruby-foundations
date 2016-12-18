class Sieve
  attr_reader :limit, :numbers
  def initialize(limit)
    @limit = limit
    @numbers = (2..@limit).to_a
  end

  def primes
    numbers.each do |num|
      numbers.reject! {|multiple| (multiple % num == 0) unless multiple == num}   
    end
    numbers
  end
end

sieve = Sieve.new(30)
p sieve.primes