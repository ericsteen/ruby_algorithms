# Factorial N!
module Factorial
  def self.iter_fact(n)
    f = 1
    (1..n).each { |i| f *= i }
    f
  end

  def self.recursive_fact(n)
    n <= 1 ? 1 : n * recursive_fact(n - 1)
  end

  def self.inject_fact(n)
    (1..n).inject(:*) || 1
  end

  def self.proc_fact(n)
    f = ->(x) { x <= 1 ? 1 : x * proc_fact(x - 1) }
    f.call(n)
  end

  def self.while_fact(n)
    i = 1
    f = 1
    while i <= n
      f *= i
      i += 1
    end
    f
  end

  def self.benchmarks
    Benchmark.benchmark "FACTORIAL\n" do |x|
      x.report('Iterative:')   { Factorial.iter_fact(2500) }
      x.report('Recursive:')   { Factorial.recursive_fact(2500) }
      x.report('Inject')       { Factorial.inject_fact(2500) }
      x.report('Proc')         { Factorial.proc_fact(2500) }
      x.report('While')        { Factorial.while_fact(2500) }
    end
  end
end
