# fibonacci sequence
module Fib
  @mem ||= {}
  # top down: recursive dynamic programming
  def self.fib(n)
    return @mem[n] if @mem[n]
    f = if n <= 2
          1
        else
          fib(n - 1) + fib(n - 2)
        end
    @mem[n] = f
    f
  end

  # bottom up: iterative
  def self.iter_fib(n)
    fib = {}
    n.times do |i|
      f = if i <= 2
            1
          else
            fib[i - 1] + fib[i - 2]
          end
      fib[i] = f
    end
    fib.values
  end

  def self.hash_fib(n)
    fib = Hash.new { |h, k| h[k] = k < 2 ? k : h[k - 1] + h[k - 2] }
    fib[n]
  end

  def self.proc_fib(n)
    f = ->(x) { x < 2 ? x : f[x - 1] + f[x - 2] }
    f[n]
  end

  def self.benchmarks
    Benchmark.benchmark "FIBONACCI\n" do |x|
      x.report('Iterative:')    { Fib.iter_fib(25) }
      x.report('Recursive:')    { Fib.fib(25) }
      x.report('Hash:')         { Fib.hash_fib(25) }
      x.report('Proc:')         { Fib.proc_fib(25) }
    end
  end
end
