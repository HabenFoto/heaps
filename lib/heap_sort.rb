

# This method uses a heap to sort an array.
# Time Complexity:  ?
# Space Complexity: ?
def heapsort(list)

  heap = MinHeap.new

  list.each  do |num|
    heap.add(num)
  end
  result = []
  until heap.empty?
    result << heap.remove
  end
  return result

end