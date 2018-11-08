require 'byebug'
require 'awesome_print'
require 'benchmark'
require_relative 'ruby_algorithms/version'
require_relative 'ruby_algorithms/algos/fibonacci'
require_relative 'ruby_algorithms/algos/factorial'
require_relative 'ruby_algorithms/algos/coin_change'
require_relative 'ruby_algorithms/algos/kadanes'
require_relative 'ruby_algorithms/algos/probability'
require_relative 'ruby_algorithms/algos/strings'
require_relative 'ruby_algorithms/algos/set_partition'
require_relative 'ruby_algorithms/algos/search/trees/bst'
require_relative 'ruby_algorithms/data_structures/containers/graphs/graph'
require_relative 'ruby_algorithms/data_structures/containers/linked_lists/linked_list'

module Enumerable
  def sum; inject { |sum, x| sum + x }; end
end

# Useful Algorithms written in Ruby

module RubyAlgorithms
end
