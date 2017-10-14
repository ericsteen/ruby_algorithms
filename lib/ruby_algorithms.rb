require 'byebug'
require 'awesome_print'
require 'benchmark'
require_relative 'ruby_algorithms/version'
require_relative 'ruby_algorithms/fibonacci'
require_relative 'ruby_algorithms/factorial'
require_relative 'ruby_algorithms/coin_change'
require_relative 'ruby_algorithms/kadanes'
require_relative 'ruby_algorithms/linked_list/linked_list'

module Enumerable
  def sum; inject { |sum, x| sum + x }; end
end

# Useful Algorithms written in Ruby

module RubyAlgorithms
end
