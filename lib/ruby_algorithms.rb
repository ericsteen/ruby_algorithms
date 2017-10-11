require 'byebug'
require 'awesome_print'
require 'benchmark'
require_relative 'ruby_algorithms/version'
require_relative 'ruby_algorithms/fibonacci'
require_relative 'ruby_algorithms/linked_list/linked_list'

# Useful Algorithms written in Ruby
module RubyAlgorithms
  def self.fib_benchmarks
    Benchmark.benchmark "FIBONACCI\n" do |x|
      x.report('Iterative:')    { Fib.iter_fib(25) }
      x.report('Recursive:')    { Fib.fib(25) }
      x.report('Hash:')         { Fib.hash_fib(25) }
      x.report('Lambda:')       { Fib.lambda_fib(25) }
    end
  end

  def self.query_benchmarks
    list = LinkedList.new
    2000.times { |i| list.append(i) }
    Benchmark.benchmark "QUERIES\n" do |x|
      x.report('#at:')          { list.at(1995) }
      x.report('#contains?:')   { list.contains?(1995) }
      x.report('#find:')        { list.find(1995) }
      x.report('#return_list:') { list.return_list }
    end
  end

  def self.update_benchmarks
    list = LinkedList.new
    2000.times { |i| list.append(i) }
    Benchmark.benchmark "UPDATES\n" do |x|
      x.report('#recursive_reverse:') { list.recursive_reverse }
      x.report('#iterative_reverse:') { list.iterative_reverse }
      x.report('#insert_before:')     { list.insert_before(3, 1995) }
      x.report('#insert_after:')      { list.insert_after(3, 1995) }
      x.report('#remove_at:')         { list.remove_at(1995) }
    end
  end
end
