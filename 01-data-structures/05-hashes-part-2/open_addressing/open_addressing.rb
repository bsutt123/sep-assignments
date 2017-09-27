require_relative 'node'
require 'pry'
class OpenAddressing

  def initialize(size)
    @nodes = Array.new(size)
  end

  def []=(key, value)
    key_index = index(key, size)
    if @nodes[key_index] == nil
      @nodes[key_index] = Node.new(key,value)
    else
      current_node = @nodes[key_index]
      current_key = current_node.key
      if current_key == key
        current_node.value = value
      else
        next_available_index = next_open_index(key_index)
        @nodes[next_available_index] = Node.new(key, value)
      end
    end

    if load_factor > 0.7
      resize
    end
  end

  def [](key)
    key_index = index(key, size)
    original_index = key_index
    current_index = key_index
    key_node = @nodes[key_index]
    while key_node.key != key
      key_index += 1
      key_node = @nodes[key_index]
    end
    key_node.value
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Given an index, find the next open index in @items
  def next_open_index(index)
    original_index = index
    current_index = index
    while @nodes[current_index]
      current_index += 1
      if current_index == original_index
        return -1
      elsif current_index == size
        current_index = 0
      end
    end
    current_index
  end

  def load_factor
    compacted_nodes = @nodes.compact
    compacted_nodes.length/size.to_f
  end

  # Simple method to return the number of items in the hash
  def size
    @nodes.size
  end

  # Resize the hash
  def resize
    new_nodes = Array.new(size*2)
    new_size = new_nodes.size
    @nodes.each do |node|
      if node
        new_key_index = index(node.key, new_size)
        if !new_nodes[new_key_index]
          new_nodes[new_key_index] = Node.new(node.key, node.value)
        else
          next_available_index = next_open_index(new_key_index)
          new_nodes[next_availabile_index] =  Node.new(node.key, node.value)
        end
      end
    end
    @nodes = new_nodes
  end
end