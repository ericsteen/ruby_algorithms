require 'spec_helper'

RSpec.describe RubyAlgorithms do
  it 'has a version number' do
    expect(RubyAlgorithms::VERSION).not_to be nil
  end

  it 'has benchmarks' do
    Fib.benchmarks
    Factorial.benchmarks
    LinkedList.query_benchmarks
    LinkedList.update_benchmarks
  end
end
