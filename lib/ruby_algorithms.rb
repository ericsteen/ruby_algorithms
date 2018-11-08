require 'byebug'
require 'awesome_print'
require 'benchmark'
require_relative 'ruby_algorithms/version'
require_relative 'ruby_algorithms/fibonacci'
require_relative 'ruby_algorithms/factorial'
require_relative 'ruby_algorithms/coin_change'
require_relative 'ruby_algorithms/kadanes'
require_relative 'ruby_algorithms/probability'
require_relative 'ruby_algorithms/strings'
require_relative 'ruby_algorithms/set_partition'
require_relative 'ruby_algorithms/linked_lists/linked_list'
require_relative 'ruby_algorithms/graphs/trees/search/bst'

module Enumerable
  def sum; inject { |sum, x| sum + x }; end
end

# Useful Algorithms written in Ruby

module RubyAlgorithms
end
