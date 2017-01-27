require_relative '../poly_tree_node/skeleton/lib/00_tree_node'
# KinghtPathFinder class
class KnightPathFinder
  DELTA = {
    ne: [-2, 1],
    nw: [-2, -1],
    se: [2, 1],
    sw: [2, -1],
    en: [1, -2],
    es: [1, 2],
    wn: [-1, -2],
    ws: [-1, 2]
  }

  def initialize(start_pos)
    @start_pos = start_pos
  end

  def find_path(end_pos)
    @path = [@start_pos]
  end
end
