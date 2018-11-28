class ProbabilitySpace

  def self.run
    space = new([[:a, 2], [:b, 3], [:a, 3], [:b, 2]])
    puts space.probability(:a) == 60
    puts space.probability(:a)
  end

  def initialize(events)
   summed_counts = events.inject(0) do |acc,e|
     acc += e[1]
     acc
   end
   # probability function over sample space
   h = Hash.new(0)
   @p = events.inject(h) do |acc, e|
     acc[e[0]] += e[1].to_f/summed_counts
     acc
   end
  end

  # TODO: compute for event sequences
  def probability(event)
    (@p[event] * 100).round
  end
end
