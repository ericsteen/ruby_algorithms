
require 'spec_helper'

RSpec.describe LinkedList, 'Insertion & Deletion' do
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

  it 'delete' do
  end
end
