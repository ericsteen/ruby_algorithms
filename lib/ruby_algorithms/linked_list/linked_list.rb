require_relative 'node'
require 'awesome_print'

# http://rubyalgorithms.com/singly_linked_list.html
class LinkedList
  attr_reader :size

  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def append(data)
    node = make_node(data)
    if @head.nil?
      @head = node
    else
      @tail.next = node
    end
    @tail = node
    @size += 1
  end

  def prepend(data)
    node = make_node(data)
    node.next = @head
    @head = node
    node
  end

  def head
    return nil if @head.nil?
    @head
  end

  def tail
    return nil if @tail.nil?
    @tail
  end

  def at(index)
    return nil if @head.nil? || index > @size - 1
    tmp = @head
    index.times { tmp = tmp.next }
    tmp.data
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

  # def find(data)
  #
  # end
  #
  # def insert_at
  #
  # end

  def remove_at!(removal_node)
    node = @head
    prev = nil

    until node.next.nil?
      (prev.next = node.next) && return if node == removal_node
      prev = node
      node = node.next
    end
  end

  # def insert_before
  #
  # end
  #
  # def insert_after
  #
  # end

  def empty?
    @head.nil?
  end

  def to_s
    curr = @head
    until curr.nil?
      curr.to_s unless curr.nil?
      curr = curr.next
    end
  end

  def reverse(node = @head)
    (@head = node) && return if node.next.nil?
    reverse(node.next)
    node.next.next = node
    node.next = nil
  end

  def return_list
    elements = []
    curr = @head
    until curr.nil?
      elements << curr
      curr = curr.next
    end
    elements
  end

  def print_list
    return_list.map(&:data).join(',')
  end

  def make_node(object)
    object.is_a?(Node) ? object : Node.new(object)
  end
end
