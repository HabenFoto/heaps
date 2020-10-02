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
  # Time Complexity: O(log(n))
  # Space Complexity: O(1)
  def add(key, value = key)
    new_element = HeapNode.new(key, value)
    next_index = @store.length
    @store[next_index] = new_element
    heap_up(next_index)

  end

  # This method removes and returns an element from the heap
  # maintaining the heap structure
  # Time Complexity: O(log(n))
  # Space Complexity: O(1)
  def remove()
    return if @store.empty?

    last_index = @store.length - 1
    swap(0, last_index)

    temp = @store[last_index]
    @store.delete_at(last_index)
    heap_down(0)

    return temp.value

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
  # Time complexity: O(1)
  # Space complexity: O(1)
  def empty?
    return @store.length == 0
  end



  private

  # This helper method takes an index and
  #  moves it up the heap, if it is less than it's parent node.
  #  It could be **very** helpful for the add method.
  # Time complexity: O(log(n))
  # Space complexity: O(1)
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
  # Time complexity: O(log(n))
  # Space complexity: O(1)
  def heap_down(index)
    return if @store.empty?
    last_index = @store.length - 1
    return if index == last_index # if index is the last one, we have reached the right most node

    right_child_idx = (2 * index) + 2
    left_child_idx = (2 * index) + 1

    return if left_child_idx > last_index #  if we reach the end of/edge of the tree return

    # only swap when current parent is greater than either of the child nodes then find the smallest of the two dscendants
    # only check the reight child if the right_child_index is less than the max valid index of the array.
    if (right_child_idx <= last_index && @store[index].key > @store[right_child_idx].key) || @store[index].key > @store[left_child_idx].key
      if (right_child_idx <= last_index &&  @store[right_child_idx].key < @store[left_child_idx].key)
        swap(right_child_idx, index) # swap only when value is greater than child
        heap_down(right_child_idx)
      else
        swap(left_child_idx, index) # swap only when value is greater than child
        heap_down(left_child_idx)
      end
    else
      return
    end

  end

  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end