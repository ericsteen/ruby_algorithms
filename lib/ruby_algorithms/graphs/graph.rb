class Graph
  def initialize
    @edge = Hash.new { |h,k| h[k] = {} }
  end

  def add_edge(u, v)
    @edge[u][v] = @edge[v][u] = true
  end

  def is_edge?(u, v)
    @edge[u][v]
  end

  # Let g be a graph with n nodes and m edges. g.print_edges runs in practice in
  # order of m time. By contrast, in a pure adjacency-matrix based approach, it
  # would run in order of n^2 time. So this is much faster for sparseness (i.e. m <<
  # n^2)
  def print_edges
    @edge.each do |u, edges_of_u|
      edges_of_u.each { |k,v| puts "{#{k}, #{v}}" }
    end
  end
end
