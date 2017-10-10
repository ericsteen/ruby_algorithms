require 'spec_helper'

RSpec.describe LinkedList, 'Queries' do
  subject do
    list = LinkedList.new
    5.times { |n| list.append(n) }
    list
  end

  it '#at' do
  end

  it 'contains' do
  end

  it 'find' do
  end

  it '#size returns sum of nodes' do
    expect(subject.size).to eq(5)
    subject.append(5)
    expect(subject.size).to eq(6)
  end

  it '#head returns the first node in the list' do
    expect(subject.head).to be_a(Node)
    expect(subject.head.data).to eq(0)
  end

  it '#tail returns the last node in the list' do
    expect(subject.tail).to be_a(Node)
    expect(subject.tail.data).to eq(4)
  end
end
