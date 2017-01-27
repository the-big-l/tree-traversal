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

  def self.valid_moves(pos)
    DELTA.values.map { |dir| [dir, pos].transpose.map { |a| a.inject(:+)}}
  end

  def initialize(start_pos)
    @start_pos = start_pos
    @visited_positions = [start_pos]
  end

  def new_move_positions(pos)
    moves = self.class.valid_moves(pos).select { |p| possible_move?(p) }
    @visited_positions.concat(moves)
  end

  def possible_move?(pos)
    @visited_positions.none? { |prev_pos| prev_pos == pos }
  end

  def find_path(end_pos)
  end

  private

  def build_move_tree

  end


end
