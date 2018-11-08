require_relative '../tree'

class BST
  def initialize(root)
    @bst = Tree.new(root)
  end

  def search(x, node)
    # returns node whose value is x. If there is no such node, returns the leaf
    # of the tree at which the search terminates
    return node if x == node
    node_children = @bst.children[node]
    return node if (x < node && !node_children[0]) || (x > node && !node_children[1])
    return (x < node) ? search(x, node_children[0]) : search(x, node_children[1])
  end

  def add(x)
    node = search(x, @bst.root)
    case node
    when x < node
      @bst.children[node] = [x]
    when x > node
      @bst.children[node] = [nil,x]
    else # x already in tree, noop
    end
  end
end

# example: Add the following sequence of numbers to BST: 5,1,8,2,3
bst=BST.new(5)
[1,8,2,3].each { |n| bst.add(n) }
ap bst
