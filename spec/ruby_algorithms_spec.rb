require 'spec_helper'

RSpec.describe RubyAlgorithms do
  it 'has a version number' do
    expect(RubyAlgorithms::VERSION).not_to be nil
  end

  it 'has benchmarks' do
    RubyAlgorithms.fib_benchmarks
    RubyAlgorithms.query_benchmarks
    RubyAlgorithms.update_benchmarks
  end
end
