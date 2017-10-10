require 'byebug'
require 'awesome_print'
require 'benchmark'
require_relative 'ruby_algorithms/version'
require_relative 'ruby_algorithms/linked_list/linked_list'

# Useful Algorithms written in Ruby
module RubyAlgorithms
  def self.run_query_benchmarks
    Benchmark.benchmark "QUERIES\n" do |x|
      list = LinkedList.new
      9.times { |i| list.append(i) }
      x.report('size:')       { list.size }
      x.report('head:')       { list.head }
      x.report('tail:')       { list.tail }
      x.report('at(index):')  { list.at(3) }
      x.report('contains?:')  { list.contains?(4) }
      # x.report('find(data):')     { list.find(5) }
      #   # x.report('return_list:')    { list.return_list }
    end
  end

  def self.run_update_benchmarks
    Benchmark.benchmark "UPDATES\n" do |x|
      list = LinkedList.new
      9.times { |i| list.append(i) }
      x.report('append:')     { list.append(10) }
      x.report('prepend:')    { list.prepend(0) }
      #   # x.report('insert_at:')      { list.insert_at(6) }
      #   # x.report('remove_at:')      { list.remove_at(6) }
      #   # x.report('insert_before:')  { list.insert_before(6) }
      #   # x.report('insert_after:')   { list.insert_after(6) }
      #   # x.report('add:')            { list.add(10) }
      #   # x.report('delete:')         { list.delete(10) }
      #   # x.report('reverse_list:')   { list.reverse_list(1) }
    end
  end
end
