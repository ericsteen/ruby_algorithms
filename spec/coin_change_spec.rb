require 'spec_helper'

RSpec.describe CoinChange do

  it '#iter_coin_change gives change for 1.49' do
    expect(CoinChange.iter_coin_change(149)).to eq([25,25,25,25,25,10,10,1,1,1,1])
  end

  it '#iter_coin_change gives change for 89' do
    expect(CoinChange.iter_coin_change(87)).to eq([25,25,25,10,1,1])
  end

  it 'has benchmarks' do
    expect(CoinChange.benchmarks).to be
  end
end
