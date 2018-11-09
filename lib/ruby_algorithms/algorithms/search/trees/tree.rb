class Tree
  attr_accessor :children
  attr_reader :root

  def initialize(root)
    @children = Hash.new([])
    @root = root
  end

  def traverse(node)
    yield node
    @children[node].each { |child| traverse(child) }
  end
end

# due to duck typing:
# tree = Tree.new(:a)
# tree.add(:a, [:b, :c, :d].to_set)
# works just fine for unordered children (default array means children is an
# ordered list) the traverse method will work , just needs collection data
# structure representing the children of a parent to have an each method defined
