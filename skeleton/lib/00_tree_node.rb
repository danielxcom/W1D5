require "byebug"

class PolyTreeNode
  attr_accessor :children, :value, :parent

  #children, value, parent = nil)
  def initialize(value)
    @value = value
    # @parent = []
    @parent = nil
    @children = []
  end

  def parent=(parent_param)
    @parent.children.delete(self) unless @parent.nil?
    @parent = parent_param
    unless @parent == nil || @parent.children.include?(self)
      @parent.children << self
    end

  end

  def add_child(c_node)
    # if @children.include?(c_node)
    #   c_node.parent = nil
    #   @children.delete(c_node)
    #
    # elsif @parent == c_node
    #   raise "Parent is designated. Cannot remove child from parent."
    # else
    #   raise "Child not found."
    # end

    c_node.parent = self
  end

  def remove_child(c_node)
    # unless @children.include?(c_node)
    #   raise "This node isn't a c_node (child)."
    # end
    # c_node.parent = nil

    # alt ans
    # c_node.parent = nil if @children.include?(c_node)
    # @children.delete(c_node) if @children.include?(c_node)

    if @children.include?(c_node)
      c_node.parent = nil
      @children.delete(c_node)
    else
      raise "Error, child not found."
    end

  end

  # def DFS(target)
  #   # return self if target == self.target
  #   return self if target == self.value
  #   return nil if @children.empty?
  # end

  def dfs(target)
      # return self if self.value == target
      # self.children.each do |child|
      #   result = child.DFS(target)
      #   return result if result
      # end
      # nil

    return self if value == target
    children.each do |child|
      result = child.dfs(target)
      return result if result
    end
    nil
  end

  def bfs(target)
    queue = [self]
    while true
      if queue.empty?
        return nil
      else
        node = queue.shift
        return node if node.value == target
        queue.concat(node.children)
      end
    end
  end

end
