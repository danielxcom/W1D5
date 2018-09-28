class PolyTreeNode
  attr_accessor :children, :value, :parent

  def initialize(children, value, parent = nil)
    @value = value
    # @parent = []
    @parent = parent
    @children = []
  end

  def parent = (parent_param)
    @parent.children.delete(self) unless @parent == nil
    @parent = parent_param
    unless @parent == nil || @parent.children.include?(self)
      @parent.children << self
    end

  end

  def add_children(c_node)
    if @children.include?(c_node)
      c_node.parent = nil
      @children.delete(c_node)

    elsif @parent == c_node
      raise "Parent is designated. Cannot remove child from parent."
    else
      raise "Child not found."
    end
  end

  def value

  end
end
