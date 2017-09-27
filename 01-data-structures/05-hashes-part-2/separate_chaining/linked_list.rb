require_relative 'node'
require 'pry'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    if self.head == nil
      self.head = node
      self.tail = node
    else 
      self.tail.next = node
      self.tail = node
    end
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    if self.head == nil
      p "There isn't anything in the linked list"
    elsif self.head.data == self.tail.data
      self.head = nil
      self.tail = nil
    else
      temp_node = self.head
      while temp_node.next != self.tail
        temp_node = temp_node.next
      end
      self.tail = temp_node
    end
  end

  # This method prints out a representation of the list.
  def print
    if self.head == nil
      p ""
    elsif self.head == self.tail
      $stdout.print("#{self.head.data}\n")
    else
      output = ""
      temp_node = self.head
      while temp_node != nil
        output += "#{temp_node.data}\n"
        temp_node = temp_node.next
      end
      $stdout.print(output)
    end
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    if node == self.head
      remove_front
    elsif node == self.tail
      remove_tail
    else
      last_node = self.head
      current_node = self.head.next
      while current_node != node
        if current_node == self.tail
          return nil
        else
          last_node = current_node
          current_node = current_node.next
        end
      end
      last_node.next = current_node.next
    end
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    if self.head == nil
      self.head = node
      self.tail = node
    else
      node.next = self.head
      self.head = node
    end
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    if self.head == nil
      p "the linked list is empty"
    elsif self.head == self.tail
      self.head = nil 
      self.tail = nil
    else
      self.head = self.head.next
    end
  end
end