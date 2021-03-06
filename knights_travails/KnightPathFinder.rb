require_relative '../poly_tree_node/skeleton/lib/00_tree_node'
require 'byebug'

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

  def self.possible_moves(pos) # add reverse to exactly match ex. paths
    DELTA.values.reverse.map { |dir| [dir[0] + pos[0], dir[1] + pos[1]] }
  end

  def initialize(start_pos)
    @start_pos = start_pos
    @visited_positions = [start_pos]
    build_move_tree
  end

  def find_path(end_pos)
    child = @root.bfs(end_pos)
    trace_path_back(child)
  end

  private

  def trace_path_back(node)
    path = [node.value]
    current_node = node
    until current_node == @root
      current_node = current_node.parent
      path.unshift(current_node.value)
    end
    path
  end

  def new_move_positions(pos)
    moves = self.class.possible_moves(pos).select { |p| valid_move?(p) }
    @visited_positions.concat(moves)

    moves
  end

  def valid_move?(pos)
    !@visited_positions.include?(pos) &&
      pos.all? { |coord| (0..7).include?(coord) }
  end

  def build_move_tree
    @root = PolyTreeNode.new(@start_pos)
    queue = [@root]

    until queue.empty?
      current_node = queue.shift

      new_move_positions(current_node.value).each do |pos|
        child_node = PolyTreeNode.new(pos)
        child_node.parent = current_node
        queue << child_node
      end
    end
  end
end
