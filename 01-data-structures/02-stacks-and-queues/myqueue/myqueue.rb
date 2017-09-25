class MyQueue
  attr_reader :head
  attr_reader :tail

  def initialize
    @queue = Array.new
    @head = @queue[0]
    @tail = @queue[-1]
  end

  def enqueue(element)
    if empty?
      @queue[0] = element
    else
      @queue[@queue.length] = element
    end
    @head = @queue[0]
    @tail = @queue[-1]
  end

  def dequeue
    if !empty?
      first_element = @queue[0]

      @queue.delete_at(0)
      @head = @queue[0]
      @tail = @queue[-1]
      return first_element
    end
  end

  def empty?
    @queue == []
  end
end