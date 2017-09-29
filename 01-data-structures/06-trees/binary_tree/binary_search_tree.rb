require_relative 'node'
require 'pry'

class BinarySearchTree
  attr_accessor :root

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    root_rating = root.rating
    if node.rating < root_rating
      left_child = root.left
      if !left_child
        root.left = node
        node.parent = root
      else
        insert(left_child, node)
      end
    elsif node.rating > root_rating
      right_child = root.right
      if !right_child
        root.right = node
        node.parent = root
      else
        insert(right_child, node)
      end
    else
      p "That number has already been cataloged, please try again."
    end
  end

  # Recursive Depth First Search
  def find(root, data)
    if data == nil
      return nil
    end
    if root == nil
      return
    elsif root.title == data
      return root
    else
      left_find = find(root.left, data)
      if left_find
        return left_find
      end   
      right_find = find(root.right, data)
      if right_find
        return right_find
      end
    end
    return 
  end

  def delete(root, data)
    if data == nil
      return nil
    elsif root == nil
      return nil
    else
      target_node = self.find(root, data)
      delete_node(target_node)
    end
  end


  def delete_node(node)
    replacement_node = node.left || node.right 
    if !replacement_node
      parent_node = node.parent
      if parent_node.left == node
        parent_node.left = nil
      elsif parent_node.right == node
        parent_node.right = nil
      else 
        p "wat?"
      end
    else
      node.rating = replacement_node.rating
      node.title = replacement_node.title
      if node.left == replacement_node
        delete_node(node.left)
      elsif node.right == replacement_node
        delete_node(node.right)
      end
    end
  end

  # Recursive Breadth First Search
  def print_tree(children = nil, all_nodes = [], times_looped = 0)
    if children == nil
      root_node = @root
      children = [root_node.left, root_node.right]
      all_nodes.push(root_node, root_node.left, root_node.right)
      times_looped += 1
      print_tree(children, all_nodes, times_looped)
    else
      next_children = []
      children.each do |child|
        if child.left
          next_children.push(child.left)
          all_nodes.push(child.left)
        end
        if child.right
          next_children.push(child.right)
          all_nodes.push(child.right)
        end
      end
      if next_children == []
        all_nodes.each do |node|
          $stdout.print("#{node.title}: #{node.rating}\n")
        end
      else
        times_looped += 1
        print_tree(next_children, all_nodes)
      end
    end
  end
end
