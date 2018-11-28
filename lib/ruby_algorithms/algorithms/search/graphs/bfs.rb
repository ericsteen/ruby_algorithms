class BFS

  def self.search(node)
    level = {node => 0}
    parent = {node => nil}
    frontier = [node]

    i = 1
    while !frontier.empty? do
      nxt = []
      frontier.each do |u|
        u.neighbors.each do |v|
          unless level[v]
            level[v] = i
            parent[v] = u
            nxt << v
          end
        end
      end
      frontier = nxt
      i += 1
    end
  end

end

Node = Struct.new(:data,:neighbors, keyword_init: true)
m = Node.new(data: :m, neighbors: []) # level 4
n1 = Node.new(data: :n1, neighbors: [m]) # level 3
n2 = Node.new(data: :n2, neighbors: [n1]) # level 3
n3 = Node.new(data: :n3, neighbors: [n1]) # level 3
n4 = Node.new(data: :n4, neighbors: [n1]) # level 3
n5 = Node.new(data: :n5, neighbors: [n2, n1]) # level 2
n6 = Node.new(data: :n6, neighbors: [n4, n3]) # level 2
n = Node.new(data: :n, neighbors: [n6,n5]) # level 1

BFS.search(n)
