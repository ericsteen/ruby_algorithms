class Stack

  # Create a Node struture to represent an individual node in the linked list. There
  # is a data field to hold any data and a next field that points to the next item
  # in the list.

  class Node
    attr_accessor :next, :data

    def initialize(data)
      @data = data
    end
  end

  # Pop nodes off the stack by overriding @top with @top.next. Finally, return the
  # data that was popped off the stack.

  def pop
    unless @top.nil?
      @top = @top.next
      @top.data if @top
    end
  end

  # Push nodes onto the stack by first checking if there is anything on the stack.
  # If not, push create a new node and add it to @top. Otherwise, store the
  # current @top in a temp variable then override @top with the new node. Finally,
  # set the next attibute to point to the old @top.

  def push(obj)
    if @top.nil?
      @top = Node.new(obj)
    else
      old_top = @top
      @top = Node.new(obj)
      @top.next = old_top
    end
  end

  # Return the data of @top, if it exists.
  def peek
    @top.data if @top
  end
end
