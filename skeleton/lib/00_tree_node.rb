# PolyTree class
class PolyTreeNode
  attr_reader :value, :parent
  attr_accessor :children

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(new_parent)
    parent.children.delete(self) unless parent.nil?

    @parent = new_parent
    parent.children << self unless parent.nil?
  end

  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child_node)
    raise "Node is not a child" unless child_node.parent
    child_node.parent = nil
  end

  def dfs(target)
    return self if value == target

    children.each do |child|
      result = child.dfs(target)
      return result if result
    end

    nil
  end

  def bfs(target)
    queue = [self]

    until queue.empty?
      current_node = queue.pop
      return current_node if current_node.value == target
      current_node.children.each { |child| queue.unshift(child) }
    end

    nil
  end
end
