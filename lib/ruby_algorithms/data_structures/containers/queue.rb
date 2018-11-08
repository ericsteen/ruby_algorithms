class Queue

  # Create a Node struture to represent an individual node in the linked list.
  # There is a data field to hold any data and a next field that points to the
  # next item in the list.

  class Node
   attr_accessor :next, :data

   def initialize(data)
     @data = data
   end
  end

  # Enqueue a new node by first checking if there is anything on the queue and if
  # so, assign a new node to the @last pointer then setting @first to @last.
  # Otherwise, we create a new node and point to it form the @last node (via the
  # next attribute). Then override @last with @last.next.

  def enqueue(obj)
   if @first.nil?
     @last = Node.new(obj)
     @first = @last
   else
     @last.next = Node.new(obj)
     @last = @last.next
   end
  end

  # If there is something on the queue store the current @first node so we can
  # return it at the end then override @first with the next node in the queue,
  # @first.next. Finally, check if the first node is nil and if so, set @last to
  # be nil.

  def dequeue
   unless @first.nil?
     orig_first = @first
     @first = @first.next
     @last = nil if @first.nil?
     orig_first
   end
  end
end
