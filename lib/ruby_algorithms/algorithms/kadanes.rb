# Because of the way this algorithm uses optimal substructures (the maximum
# subarray ending at each position is calculated in a simple way from a related
# but smaller and overlapping subproblem: the maximum subarray ending at the
# previous position) this algorithm can be viewed as a simple/trivial example of
# dynamic programming.
module Kadanes
  # the trick is that at any point in the iteration if starting a new chain is
  # better than your current score with this element added to it, then do so.
  # the interesting part is proving the math behind it
  def self.max_subarray_sum(arr)
    max_so_far = max_ending_here = -1.0 / 0 # -Infinity
    arr.each do |i|
      max_ending_here = [i, max_ending_here + i].max
      max_so_far = [max_so_far, max_ending_here].max
    end
    max_so_far
  end

  # Answer is stored in "slice". It is very slow O(n**3)
  def self.brute_force(arr)
    max, slice = 0, []
    arr.each_index do |i|
      (i...arr.length).each do |j|
        sum = arr[i..j].inject(0, :+)
        max, slice = sum, arr[i..j]  if sum > max
      end
    end
    [max, slice]
  end

  def self.benchmarks
    Benchmark.benchmark "KADANES\n" do |x|
      x.report('#max_subarray_sum:')  { Kadanes.max_subarray_sum((-1_000..1_000).to_a.sample(500)) }
      x.report('#brute_force:')       { Kadanes.brute_force((-1_000..1_000).to_a.sample(500)) }
    end
  end
end
