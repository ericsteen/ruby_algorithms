require_relative 'node'
require_relative 'list_helpers'

# Singly Linked List
class LinkedList
  include ListHelpers

  attr_reader :size

  def initialize
    @head = nil
    @size = 0
  end

  def recursive_reverse(node = @head)
    (@head = node) && return if node.next.nil?
    recursive_reverse(node.next)
    node.next.next = node
    node.next = nil
  end

  def iterative_reverse(node = @head)
    curr = node
    prev = nil
    until curr.nil?
      after = curr.next
      curr.next = prev
      prev = curr
      curr = after
    end
    @head = prev
  end

  def contains?(data)
    return false if @head.nil?
    curr = @head
    until curr.nil?
      return true if curr.data == data
      curr = curr.next
    end
    false
  end

  def find(data)
    raise(NotFoundError, 'Not Found') if @head.nil?
    curr = @head
    index = 0
    until curr.nil?
      return index if curr.data == data
      index += 1
      curr = curr.next
    end
    raise NotFoundError, 'Not Found'
  end

  def insert_before(value, index)
    node = Node.new(value)
    prev = at(index - 1)
    curr = at(index)
    prev.next = node
    node.next = curr
    @size += 1
  end

  def insert_after(value, index)
    node = Node.new(value)
    curr = at(index)
    after = curr.next
    curr.next = node
    node.next = after
    @size += 1
  end

  def remove_at(index)
    current_node = at(index)
    next_node = current_node.next
    previous_node = at(index - 1)
    previous_node.next = next_node
    current_node.next = nil
    @size -= 1
  end

  def at(index)
    return nil if @head.nil? || index > @size - 1
    tmp = @head
    index.times { tmp = tmp.next }
    tmp
  end

  def self.query_benchmarks
    list = LinkedList.new
    2000.times { |i| list.append(i) }
    Benchmark.benchmark "LINKEDLIST QUERIES\n" do |x|
      x.report('#at:')          { list.at(1995) }
      x.report('#contains?:')   { list.contains?(1995) }
      x.report('#find:')        { list.find(1995) }
      x.report('#return_list:') { list.return_list }
    end
  end

  def self.update_benchmarks
    list = LinkedList.new
    2000.times { |i| list.append(i) }
    Benchmark.benchmark "LINKEDLIST UPDATES\n" do |x|
      x.report('#recursive_reverse:') { list.recursive_reverse }
      x.report('#iterative_reverse:') { list.iterative_reverse }
      x.report('#insert_before:')     { list.insert_before(3, 1995) }
      x.report('#insert_after:')      { list.insert_after(3, 1995) }
      x.report('#remove_at:')         { list.remove_at(1995) }
    end
  end
end
