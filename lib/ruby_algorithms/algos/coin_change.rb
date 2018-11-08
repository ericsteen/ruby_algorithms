module CoinChange

  def self.iter_coin_change(amount, coins = [25, 10, 5, 1])
    coins.sort { |c| -c }.flat_map do |v|
      f = amount/v; amount %= v; Array.new(f){v}
    end
  end

  def make_change(a, list = [25, 10, 5, 1])
    return nil if a < 0
    return nil if a != a.floor

    parents = Array.new(a + 1)
    parents[0] = 0
    worklist = [[0, 0]]
    while parents[a].nil? && !worklist.empty? do
      base, starting_index = worklist.shift
      starting_index.upto(list.size - 1) do |index|
        coin = list[index]
        tot = base + coin
        if tot <= a && parents[tot].nil?
          parents[tot] = base
          worklist << [tot, index]
        end
      end
    end

    return nil if parents[a].nil?
    result = []
    while a > 0 do
      parent = parents[a]
      result << a - parent
      a = parent
    end
    result.sort!.reverse!
 end


  def self.recursive_coin_change(amount, coins = [25, 10, 5, 1])

  end

  def self.hash_coin_change(amount, coins = [25, 10, 5, 1])
   coins.sort! { |c| -c }

   # memoize solutions
   optimal_change = Hash.new do |hash, key|
     hash[key] = if key < coins.min
       []
     elsif coins.include?(key)
       [key]
     else
      #  byebug
       coins.
         # prune unhelpful coins
         reject { |coin| coin > key }.

         # prune coins that are factors of larger coins
         inject([]) {|mem, var| mem.any? {|c| c%var == 0} ? mem : mem+[var]}.

         # recurse
         map { |coin| [coin] + hash[key - coin] }.

         # prune unhelpful solutions
         reject { |change| change.sum != key }.

         # pick the smallest, empty if none
         min { |a, b| a.size <=> b.size } || []
     end
   end

   optimal_change[amount]
  end

  def self.benchmarks
    Benchmark.benchmark "COIN CHANGE\n" do |x|
      x.report('Iterative:')    { CoinChange.iter_coin_change(23.11) }
      x.report('Recursive:')    { CoinChange.recursive_coin_change(23.11) }
      x.report('Hash:')         { CoinChange.hash_coin_change(23.11) }
    end
  end
end
