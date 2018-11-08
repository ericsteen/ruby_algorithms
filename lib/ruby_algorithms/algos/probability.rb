require 'awesome_print'
class ProbabilitySpace

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

  def probability(event)
    # TODO: compute for event sequence
    # event.inject { |acc, e| acc += @p[e] }

    (@p[event] * 100).round
  end

end

space = ProbabilitySpace.new([[:a, 2], [:b, 3], [:a, 3], [:b, 2]])
puts space.probability(:a) == 60
puts space.probability(:a)
