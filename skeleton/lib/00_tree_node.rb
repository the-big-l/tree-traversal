# PolyTree class
class PolyTreeNode
  attr_reader :value, :parent
  attr_accessor :children

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(parent_node)
    unless parent == parent_node
      if parent_node.nil?
        parent.remove_child(self)
        @parent = nil
      else
        parent_node.add_child(self) unless parent_node.children.include?(self)
        @parent.remove_child(self) unless parent.nil?
        @parent = parent_node
      end
    end
  end

  def add_child(child_node)
    children << child_node
  end

  def remove_child(child_node)
    children.delete(child_node)
  end

  # def remove_parent

end
