class DFS

  def self.search(node, parent={})
    node.neighbors.each do |v|
      unless parent[v]
        parent[v] = node
        puts node.data
        search(v, parent)
      end
    end
  end

end

Node = Struct.new(:data,:neighbors, keyword_init: true)
m = Node.new(data: :m, neighbors: []) # level 4
n1 = Node.new(data: :n1, neighbors: [m]) # level 3
n2 = Node.new(data: :n2, neighbors: [m]) # level 3
n3 = Node.new(data: :n3, neighbors: [n1]) # level 3
n4 = Node.new(data: :n4, neighbors: [n1]) # level 3
n5 = Node.new(data: :n5, neighbors: [n2, n1]) # level 2
n6 = Node.new(data: :n6, neighbors: [n4, n5]) # level 2
n = Node.new(data: :n, neighbors: [n6]) # level 1

DFS.search(n)
