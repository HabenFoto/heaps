class HeapNode
  attr_reader :key, :value

  def initialize(key, value)
    @key = key
    @value = value
  end
end

class MinHeap

  def initialize
    @store = []
  end

  # This method adds a HeapNode instance to the heap
  # Time Complexity: ?
  # Space Complexity: ?
  def add(key, value = key)
    new_element = HeapNode.new(key, value)
    next_index = @store.length 
    @store[next_index] = new_element
    heap_up(next_index)

  end

  # This method removes and returns an element from the heap
  # maintaining the heap structure
  # Time Complexity: ?
  # Space Complexity: ?
  def remove()
    return if @store.empty?
    heap_down(0) # 0 would be the root

    last_index = @store.length -1
    temp = @store[last_index]
    @store.delete_at(last_index)

    return temp
 
  end


  # Used for Testing
  def to_s
    return "[]" if @store.empty?

    output = "["
    (@store.length - 1).times do |index|
      output += @store[index].value + ", "
    end

    output += @store.last.value + "]"
      
    return output
  end

  # This method returns true if the heap is empty
  # Time complexity: ?
  # Space complexity: ?
  def empty?
    return @store.length == 0
  end

  private

  # This helper method takes an index and
  #  moves it up the heap, if it is less than it's parent node.
  #  It could be **very** helpful for the add method.
  # Time complexity: ?
  # Space complexity: ?
  def heap_up(index)
    return if index == 0  # if index is 0 it means its a parent so no need to perform heap up

    if index % 2 == 0 # if index is even number it means its a right chile as right_child = 2*(i) + 2 <-- and this is always even number
      parent_index = (index - 2) / 2
    else
      parent_index = (index - 1) / 2
    end

    if @store[index].key < @store[parent_index].key
      swap(index, parent_index)
      heap_up(parent_index)
    else
      return
    end

  end

  # This helper method takes an index and 
  #  moves it up the heap if it's smaller
  #  than it's parent node.
  def heap_down(index)
    return if @store.empty?
    last_index = @store.length -1
    return if index == last_index # if index is the last one, we have reached the right most node
  
    
    right_child_idx = (2 * index) + 2
    left_child_idx = (2 * index) + 1

    if left_child_idx == last_index
      swap(left_child_idx, index)
    else
      swap(right_child_idx, index)
    end

    heap_down(right_child_idx)

  end

  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end