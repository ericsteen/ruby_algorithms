require_relative 'node'
require_relative 'list_helpers'

# Singly Linked List
class LinkedList
  include ListHelpers

  attr_reader :size

  def initialize
    @head = nil
    @tail = nil
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
end
