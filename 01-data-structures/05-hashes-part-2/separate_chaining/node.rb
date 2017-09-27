class Node
  attr_accessor :next
  attr_accessor :key
  attr_accessor :value
  attr_accessor :data

  def initialize(key, value)
  	self.key = key
  	self.value = value
  	self.data = [key, value]
  end
end