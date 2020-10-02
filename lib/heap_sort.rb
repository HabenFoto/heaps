

# This method uses a heap to sort an array.
# Time Complexity:  ?
# Space Complexity: ?
def heapsort(list)

  heap = MinHeap.new

  list.each  do |num|
    heap.add(num)
  end
  return heap.to_array

end