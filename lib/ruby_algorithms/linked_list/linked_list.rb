class LinkedList

  def initialize(data)
    @head = Node.new(data, nil)
  end

  def add(data)
    current = @head
    while current.next != nil
      current = current.next
    end
    current.next = Node.new(data, nil)
  end

  def delete(data)
    current.next = @head
    if current.data = data
      @head = current.next
    else
      while (current.next != nil) && (current.next.data != data)
        current = current.next
      end
      unless current.next == nil
        current.next = current.next.next
      end
    end
  end

  # Basically, we solve this problem recursively. Given a node,
  # we first check whether or not the node is the last of the list.
  # If it is, then we just return immediately (i.e. the reverse of [6]
  # is just [6]). If not, pass the next node into our reverse function.
  # This will reverse the list and place the node that we passed in at the
  # end of the reversed list. Then, stick our current node on the “next” of
  # this list. It’s a bit confusing because of the trick that the next of
  # the current node actually ends up at the end of the reversed list so the
  # next of the next of the current node is where we want to put the current node.
  # Check it out in code:


  def reverse_list(curr)
    return curr if curr == nil or curr.next_node == nil

    next_node = curr.next_node
    new_head = reverse_list(curr.next_node)
    next_node.next_node = curr
    curr.next_node = nil
    return new_head
  end

  def return_list
    elements = []
    current = @head
    while current.next != nil
      elements << current
      current = current.next
    end
    elements << current
  end
end
