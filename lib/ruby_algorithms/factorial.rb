# Factorial N!
module Factorial
  def self.iter_fact(n)
    f = 1
    n.times { |i| f *= i }
    f
  end

  def self.recursive_fact(n)
    n <= 1 ? 1 : n * recursive_fact(n - 1)
  end

  def self.inject_fact(n)
    (1..n).inject(:*) || 1
  end

  def self.proc_fact(n)
    f = -> (x) { x <= 1 ? 1 : x * proc_fact(x - 1) }
    f.(n)
  end

  def self.benchmarks
    Benchmark.benchmark "FACTORIAL\n" do |x|
      x.report('Iterative:')   { Factorial.iter_fact(250) }
      x.report('Recursive:')   { Factorial.recursive_fact(250) }
      x.report('Inject')       { Factorial.inject_fact(250) }
      x.report('Proc')         { Factorial.proc_fact(250) }
    end
  end
end
