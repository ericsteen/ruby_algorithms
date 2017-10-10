require 'spec_helper'

RSpec.describe RubyAlgorithms do
  it 'has a version number' do
    expect(RubyAlgorithms::VERSION).not_to be nil
  end

  it 'has benchmarks' do
    RubyAlgorithms.run_benchmarks
  end
end
