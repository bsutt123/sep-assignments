class MyStack
  attr_reader :top

  def initialize
    @stack = Array.new
    @top = nil
  end

  def push(item)
    if empty?
      @stack[0] = item
    else
      @stack[@stack.length] = item
    end
    @top = @stack[-1]
  end

  def pop
    if !empty?
      top_element = @stack[-1]
      @stack.delete_at(@stack.length-1)
      @top = @stack[-1]
      top_element
    end
  end

  def empty?
    @stack == []
  end
end