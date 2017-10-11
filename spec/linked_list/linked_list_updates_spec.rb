require 'spec_helper'

RSpec.describe LinkedList, 'Updates' do
  subject do
    list = LinkedList.new
    5.times { |n| list.append(n) }
    list
  end

  it '#append inserts an item after the end of the list' do
    expect(subject.print_list).to eq('0,1,2,3,4')
    subject.append(5)
    expect(subject.print_list).to eq('0,1,2,3,4,5')
  end

  it '#prepend inserts an item before the head of the list' do
    expect(subject.print_list).to eq('0,1,2,3,4')
    subject.prepend(-1)
    expect(subject.print_list).to eq('-1,0,1,2,3,4')
  end

  it '#delete' do
  end

  it '#reverse returns the list in opposite order' do
    expect(subject.print_list).to eq('0,1,2,3,4')
    subject.recursive_reverse
    expect(subject.print_list).to eq('4,3,2,1,0')
  end

  it '#iter_reverse returns the list in opposite order' do
    expect(subject.print_list).to eq('0,1,2,3,4')
    subject.iterative_reverse
    expect(subject.print_list).to eq('4,3,2,1,0')
  end

  it '#insert_before' do
    expect(subject.print_list).to eq('0,1,2,3,4')
    subject.insert_before(5, 1)
    expect(subject.print_list).to eq('0,5,1,2,3,4')
  end

  it '#insert_after' do
    expect(subject.print_list).to eq('0,1,2,3,4')
    subject.insert_after(5, 1)
    expect(subject.print_list).to eq('0,1,5,2,3,4')
  end

  it '#remove_at' do
    expect(subject.print_list).to eq('0,1,2,3,4')
    subject.remove_at(1)
    expect(subject.print_list).to eq('0,2,3,4')
  end
end
