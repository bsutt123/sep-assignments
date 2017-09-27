require_relative 'linked_list'
require "pry"

class SeparateChaining
  attr_reader :max_load_factor
  attr_reader :linked_lists

  def initialize(size)
    @max_load_factor = 0.7
    @linked_lists = Array.new(size) {LinkedList.new}

  end

  def []=(key, value)
    new_key_index = index(key, array_size)
    linked_list = @linked_lists[new_key_index]
    linked_list.add_to_tail(Node.new(key,value))
    if load_factor > @max_load_factor
      resize
    end
  end

  def [](key)
    key_index = index(key, array_size)
    linked_list = @linked_lists[key_index]
    current_node = linked_list.head
    while current_node && current_node.key != key
      current_node = current_node.next
    end
    if !current_node
      p "That key doens't exist yet"
      return
    else
      current_node.value
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Calculate the current load factor
  def load_factor
    (num_hash_items.to_f)/array_size
  end

  # Simple method to return the underlying array size
  def array_size
    @linked_lists.size
  end

  #Returns the total number of items in the hash
  def num_hash_items
    num_hash_items = 0
    @linked_lists.each do |linked_list|
      current_item = linked_list.head
      while current_item &&
        num_hash_items += 1
        current_item = current_item.next
      end
    end
    num_hash_items
  end

  # Resize the hash
  def resize
    new_linked_lists = Array.new(array_size*2) {LinkedList.new}
    new_size = new_linked_lists.size
    @linked_lists.each do |linked_list|
      current_node = linked_list.head
      while current_node
        current_nodes_new_index = index(current_node.key, new_size)
        current_nodes_linked_list = new_linked_lists[current_nodes_new_index]
        current_nodes_linked_list.add_to_tail(Node.new(current_node.key, current_node.value))
        current_node = current_node.next
      end
    end
    @linked_lists = new_linked_lists
  end
end
