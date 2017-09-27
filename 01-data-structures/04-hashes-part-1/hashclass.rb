require_relative 'hash_item'
require 'pry'

class HashClass
  attr_reader :items

  def initialize(size)
    @items = Array.new(size)

  end

  def []=(key, value)
    if !@items[index(key,size)]
      @items[index(key,size)] = HashItem.new(key, value)
    else
      current_hash_item = @items[index(key, size)]
      if (current_hash_item.key == key)
        @items[index(key,size)].value = value
      else
        resize
        @items[index(key,size)] =  HashItem.new(key,value)
      end
    end
  end


  def [](key)
    @items[index(key,size)].value
  end

  def resize
    current_size = size
    next_array = Array.new(current_size*2)
    @items.each do |hash_item|
      if hash_item
        key = hash_item.key
        value = hash_item.value
        new_index = index(key,next_array.length)
        next_array[new_index] = hash_item
      end
    end
    @items = next_array
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Simple method to return the number of items in the hash
  def size
    @items.size
  end

end