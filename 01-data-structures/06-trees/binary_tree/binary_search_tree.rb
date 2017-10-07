require_relative 'node'
require 'pry'

class BinarySearchTree
  attr_accessor :root

  def initialize(root)
    @root = root
  end

  def insert(root, node)
  #inserts a node into tree

    #create a variable for the roots rating
    root_rating = root.rating

    #if the rating of the node is less than the root
    if node.rating < root_rating

      #check to see if there is a child on the left side of root
      left_child = root.left

      #if there isn't then assign the node to that position
      if !left_child
        root.left = node
        node.parent = root

      #if there is, then recursively insert into that node as the new root
      else
        insert(left_child, node)
      end

    #if the node rating is great than the roots
    elsif node.rating > root_rating

      #check to see if right child exists
      right_child = root.right

      #if it doesn't, the put the node there
      if !right_child
        root.right = node
        node.parent = root

      #if it does, then recursively insert it into that position
      else
        insert(right_child, node)
      end

    #if you have a rating that is the same. it will throw this out
    else
      p "That number has already been cataloged, please try again."
      return
    end
  end

  # Recursive Depth First Search
  def find(root, data)

    #if data is not put it, then don't return anything
    if data == nil
      return nil
    end
    #if you aren't given a root, don't return anything
    if root == nil
      return
    #if the root is the data you are searching for
    elsif root.title == data

      #return the root
      return root
    else
      #recursively find the node on the left side
      left_find = find(root.left, data)

      #if you find the node, return the value without calling the right side recursive part
      if left_find
        return left_find
      end   

      #similiar tactics for the right find 
      right_find = find(root.right, data)
      if right_find
        return right_find
      end
    end

    #if you don't findit, return nil
    return 
  end

  def find_by_rating(root, target_rating)
    if target_rating == nil
      return nil
    elsif root == nil
      return nil
    elsif root.rating == target_rating
      return root
    else
      if target_rating > root.rating
        return find_by_rating(root.right, target_rating)
      elsif target_rating < root.rating
        return find_by_rating(root.left, target_rating)
      else
        p "wat"
        binding.pry
      end
    end
  end


  def delete(root, data)
    #if the data or the root is not given, then return nil
    if data == nil
      return nil
    elsif root == nil
      return nil
    else
      #find the target node using find
      target_node = self.find(root, data)

      #delete that node
      delete_node(target_node)
    end
  end

  def delete_node(node)
    #set the current node to be the node
    current_node = node

    #while the current node isn't a life
    while current_node.left || current_node.right

      #swap the node for its left child if it exists
      if current_node.left
        swap_node(current_node.left, current_node)


      #otherwise swap it for the right child
      else
        swap_node(current_node.right, current_node)
      end
    end

    # find the parent of the node after it has been leafified
    current_parent = current_node.parent
    
    #if the parent is nil, then it means that you are trying to delete the root of the tree when it has no leaves, and the tree should be nil then
    if current_parent == nil
      @root = nil

    # break the connection between the current node and its parent
    elsif current_parent.left == current_node
      current_parent.left = nil
    elsif current_parent.right == current_node
      current_parent.right = nil
    else
      p "wat"
    end

    #delete the node from memory
    current_node = nil
  end

  # Recursive Breadth First Search
  def print_tree(children = nil, all_nodes = [], times_looped = 0)
  #I kept getting strange errors using printf, so I made it print_tree

    #if we are at the default value
    if children == nil
      root_node = @root

      #store the roots children
      children = [root_node.left, root_node.right]

      #push all the nodes onto an array
      all_nodes.push(root_node, root_node.left, root_node.right)
      times_looped += 1

      #remove any nil values from all_nodes
      all_nodes = all_nodes.compact

      #if there isn't a full array, then print the nodes out
      if all_nodes.length < 3
        all_nodes.each do |node|
          $stdout.print("#{node.title}: #{node.rating}\n")
        end

      #recurse otherwise
      else
        print_tree(children, all_nodes, times_looped)
      end
    else

      #create an array for the next children to search
      next_children = []

      #iterate over all the current children
      children.each do |child|

        #if the left child exists, push it onto the array of children to search and of all nodes
        if child.left
          next_children.push(child.left)
          all_nodes.push(child.left)
        end

        #if the right child exists push it onto the array of children to search and of all nodes
        if child.right
          next_children.push(child.right)
          all_nodes.push(child.right)
        end
      end

      #if there are no more children to search
      if next_children == []

        #print all nodes to standard out
        all_nodes.each do |node|
          $stdout.print("#{node.title}: #{node.rating}\n")
        end
      else

        #otherwise, iterate again
        times_looped += 1
        print_tree(next_children, all_nodes)
      end
    end
    return
  end

  private

  def swap_node(parent_node, child_node)
    #So for this function we are essentially swapping a parents position with one of its child nodes
    #The function will not work if you swap a node that isn't one of the children of the parent
    original_child_node = child_node.dup
    original_parent_node = parent_node.dup
    #store the bottom children to latter assign after
    child_left = child_node.left
    child_right = child_node.right

    #store the parent of the higher node to connect back togehter
    parent_parent = parent_node.parent

    # check if the child_node branches to the left or right of the parent_node
    if parent_node.left == child_node

      #store the other node attached to the parent if it exists
      other_node = parent_node.right

      #break all connections
      child_node.left = nil
      child_node.right = nil
      child_node.parent = nil

      parent_node.left = nil
      parent_node.right = nil
      parent_node.parent = nil

      #swap the parent and child node
      child_node.left = parent_node

      # if the other node exists, connect it back to the swaped child node
      if other_node
        child_node.right = other_node
        other_node.parent = child_node
      else
        child_node.right = nil
      end
    else
      #store the other node attached to the parent
      other_node = parent_node.left

      #break all connections
      child_node.left = nil
      child_node.right = nil
      child_node.parent = nil

      parent_node.left = nil
      parent_node.right = nil
      parent_node.parent = nil


      #swap the parent and the child nodes connection
      child_node.right = parent_node

      #if the other node exists, then attach it back to the child
      if other_node
        child_node.left = other_node
        other_node.parent = child_node
      else
        child_node.right = nil
      end
    end 

    #if the left child exists, attach it to parent
    if child_left
      parent_node.left = child_left
      child_left.parent = parent_node
    else
      parent_node.left = nil
    end
    
    #if the right child exists, attach it to parent
    if child_right 
      parent_node.right = child_right
      child_right.parent = parent_node
    else
      parent_node.right = nil
    end
    
    # form the double connction to the parent child relationship
    parent_node.parent = child_node


    # if the parents parent original exisisted
    if parent_parent
      #determine if the parent was on the left or right of its original parent
      if parent_parent.left && parent_parent.left.title == parent_node.title
        #set it up on the left if it originally connected there
        parent_parent.left = child_node
        child_node.parent = parent_parent
      elsif parent_parent.right && parent_parent.right.title == parent_node.title
        #set it up on the right otherwise
        parent_parent.right = child_node
        child_node.parent = parent_parent
      end
    else
      #if the parents parent doesn't exist, it was the root node, and now you need to change the root
      @root = child_node
    end
  end

end
