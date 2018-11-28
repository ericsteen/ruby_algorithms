require 'byebug'
require 'awesome_print'
require 'benchmark'
# data structures
require_relative 'ruby_algorithms/version'
require_relative 'ruby_algorithms/containers/stack'
require_relative 'ruby_algorithms/containers/queue'
require_relative 'ruby_algorithms/containers/heap'
require_relative 'ruby_algorithms/containers/priority_queue'
require_relative 'ruby_algorithms/containers/linked_lists/linked_list'
require_relative 'ruby_algorithms/containers/hash_table'
require_relative 'ruby_algorithms/containers/graphs/graph'
# algorithms
require_relative 'ruby_algorithms/algorithms/search/graphs/tree'
require_relative 'ruby_algorithms/algorithms/search/graphs/bst'
require_relative 'ruby_algorithms/algorithms/search/graphs/bfs'
require_relative 'ruby_algorithms/algorithms/search/graphs/dfs'
require_relative 'ruby_algorithms/algorithms/statistics/probability'
require_relative 'ruby_algorithms/algorithms/set_partition'
require_relative 'ruby_algorithms/algorithms/search/trees/bst'
require_relative 'ruby_algorithms/algorithms/pattern_matching/string_similarity'
require_relative 'ruby_algorithms/algorithms/fibonacci'
require_relative 'ruby_algorithms/algorithms/factorial'
require_relative 'ruby_algorithms/algorithms/coin_change'
require_relative 'ruby_algorithms/algorithms/kadanes'


module Enumerable
  def sum; inject { |sum, x| sum + x }; end
end

# Useful Algorithms written in Ruby

module RubyAlgorithms
end
