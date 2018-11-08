class Tree
  attr_reader :children
  attr_reader :root

  def initialize(root)
    @children = Hash.new([])
    @root = root
    @child_to_parent = {}
  end

  def traverse(node)
    yield node
    @children[node].each { |child| traverse(child) }
  end

  def add(parent, children)
    @children[parent] = children
    children.each do |child|
      @child_to_parent[child] = parent
    end
  end

  def find_path_to_root(node)
    path = []
    cur_node = node
    path << cur_node
    while cur_node  = @child_to_parent[cur_node]
      path.reverse! # if we want path direction for root-to-node
      return path
    end
  end
end

# due to duck typing:
# tree = Tree.new(:a)
# tree.add(:a, [:b, :c, :d].to_set)
# works just fine for unordered children (default array means children is an
# ordered list) the traverse method will work , just needs collection data
# structure representing the children of a parent to have an each method defined
