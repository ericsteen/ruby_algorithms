class LinkedList
  # Singly Linked List Helpers
  module ListHelpers
    class NotFoundError < RuntimeError; end

    def append(data)
      node = make_node(data)
      if @head.nil?
        @head = node
      else
        curr = at(@size - 1)
        after = curr.next
        curr.next = node
        node.next = after
      end
      @size += 1
    end

    def prepend(data)
      node = make_node(data)
      node.next = @head
      @head = node
      node
    end

    def empty?
      @head.nil?
    end

    def head
      return nil if @head.nil?
      @head
    end

    def tail
      raise 'No tail for Singly Linked List' unless @tail
      return nil if @tail.nil?
      @tail
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

    def make_node(object)
      object.is_a?(Node) ? object : Node.new(object)
    end

    def to_s
      curr = @head
      until curr.nil?
        curr.to_s unless curr.nil?
        curr = curr.next
      end
    end

    def print(&_block)
      node = @head

      until node.nil?
        node = node.next
        yield node
      end
    end

    def print_list
      return_list.map(&:data).join(',')
    end
  end
end
