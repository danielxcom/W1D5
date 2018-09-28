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

  def delete_child(c_node)
    unless @children.include?(c_node)
      raise "This node isn't a c_node (child)."
    end
    c_node.parent = nil
  end

  # def DFS(target)
  #   # return self if target == self.target
  #   return self if target == self.value
  #   return nil if @children.empty?
  # end

  def DFS(target)
      return self if self.value == target
      self.children.each do |child|
        result = child.DFS(target)
        return result if result
      end
      nil
    end

end
