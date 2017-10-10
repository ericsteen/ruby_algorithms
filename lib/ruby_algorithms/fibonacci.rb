# fibonacci sequence
module Fib
  @mem ||= {}
  # top down: recursive
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
  def self.iter_fib(n = 25)
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

  def self.hash_fib
    fib = Hash.new { |h, k| h[k] = k < 2 ? k : h[k - 1] + h[k - 2] }
    fib[25]
  end

  def self.lambda_fib
    f = ->(x) { x < 2 ? x : f[x - 1] + f[x - 2] }
    f[6]
  end

  def self.run_benchmarks
    Benchmark.benchmark "FIBONACCI" do |x|
      x.report('fib:')         { Fib.fib(25) }
      x.report('iter_fib:')    { Fib.iter_fib }
      x.report('hash_fib:')    { Fib.hash_fib }
      x.report('lambda_fib:')  { Fib.lambda_fib }
    end
  end
end
