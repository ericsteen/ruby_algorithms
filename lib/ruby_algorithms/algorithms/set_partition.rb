class Partition

  def initialize(s)
    @s = s
    @e_to_p = {}
    @p = []
    @s.each do |e|
      @p << Set.new(e)
      @e_to_p[e] = @p.length-1
    end
  end

  def union(x,y)
    i,j = [@e_to_p[x], @e_to_p[y]]
    i,j = [j,i] if @p[i].length < @p[j].length
    @p[j].each { |e| @e_to_p[e] = i }
    @p[i] += @p[j]
    @p[j] = nil
  end
end
