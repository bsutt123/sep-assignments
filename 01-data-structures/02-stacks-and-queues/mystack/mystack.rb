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
      if @stack.length == 1
        @stack = []
      else
        @stack = @stack[0...(@stack.length-1)]
      end
      @top = @stack[-1]
      top_element
    end
  end

  def empty?
    @stack == []
  end
end