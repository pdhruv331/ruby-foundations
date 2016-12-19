# Compares hamming distance
class DNA
  def initialize(strand)
    @strand = strand.chars
  end

  def hamming_distance(other_strand)
    @strand.zip(other_strand.chars).count do |acid_pair|
      acid_pair.uniq.size > 1 && !acid_pair.include?(nil)
    end
  end
end
