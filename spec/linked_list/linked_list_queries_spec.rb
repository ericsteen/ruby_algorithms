require 'spec_helper'

RSpec.describe LinkedList, 'Queries' do
  subject do
    list = LinkedList.new
    5.times { |n| list.append(n) }
    list
  end

  it '#at' do
    expect(subject.print_list).to eq('0,1,2,3,4')
    expect(subject.at(2)).to be_a(Node)
    expect(subject.at(2).data).to eq(2)
    expect(subject.at(5)).to eq(nil)
  end

  it 'contains' do
    expect(subject.print_list).to eq('0,1,2,3,4')
    expect(subject.contains?(2)).to eq(true)
    expect(subject.contains?(5)).to eq(false)
  end

  it 'find' do
    expect(subject.print_list).to eq('0,1,2,3,4')
    expect(subject.find(2)).to eq(2)
    expect { subject.find(5) }.to \
      raise_error(LinkedList::NotFoundError, 'Not Found')
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
    expect { subject.tail }.to raise_error
  end
end
