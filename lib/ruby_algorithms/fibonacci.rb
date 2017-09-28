# fibonacci sequence
module Fib

  def self.mem(store={})
    @mem ||= store
  end

  # top down: recursive
  def self.fib(n)
    return mem[n] if mem[n]
    if n <= 2
      f = 1
    else
      f = fib(n-1) + fib(n-2)
    end
    mem[n] = f
    puts f
    return f
  end

  # bottom up: iterative
  def iter_fib(n=1..25)
    fib = {}
    for i in 1..(n.size-1)
      if i <= 2
        f = 1
      else
        f = fib[i-1] + fib[i-2]
      end
      fib[i] = f
      puts f
    end
  end
end


Fib.fib(25)
puts Fib.mem

# iter_fib

# h = Hash.new { |hash,key| hash[key] = hash[key-1] + hash[key-2] }
# h[25]
