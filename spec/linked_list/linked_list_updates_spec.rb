require 'spec_helper'

RSpec.describe LinkedList, 'Updates' do
  subject do
    list = LinkedList.new
    5.times { |n| list.append(n) }
    list
  end

  it '#reverse returns the list in opposite order' do
    expect(subject.print_list).to eq('0,1,2,3,4')
    subject.reverse
    expect(subject.print_list).to eq('4,3,2,1,0')
  end

  it 'insert_at' do
  end

  it 'remove_at' do
  end

  it 'insert_before' do
  end

  it 'insert_after' do
  end
end
