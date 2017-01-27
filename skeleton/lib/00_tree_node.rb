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
    unless parent == new_parent
      if new_parent.nil?
        remove_parent
      else
        add_parent(new_parent)
      end
    end
  end

  def add_child(child_node)
    children << child_node
  end

  def remove_child(child_node)
    children.delete(child_node)
  end

  def remove_parent
    parent.remove_child(self)
    @parent = nil
  end

  def add_parent(new_parent)
    new_parent.add_child(self) unless new_parent.children.include?(self)
    @parent.remove_child(self) unless parent.nil?
    @parent = new_parent
  end

end
