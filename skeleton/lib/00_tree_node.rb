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

end
