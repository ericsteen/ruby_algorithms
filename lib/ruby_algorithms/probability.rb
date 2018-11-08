class ProbabilitySpace
  
  def initialize(sample_space_and_counts)
    summed_counts = sample_space_and_counts.inject {|s,x| s += x }
    @p = {}
    sample_space_and_counts.each { |e,c| @p[e] = c.to_f/summed_counts }
  end

  def probability(event)
    p = 0
    event.each { |e| p += @p[e] }
    return p
  end

end
