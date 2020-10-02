

# This method uses a heap to sort an array.
# Time Complexity:  O(n log(n))
# Space Complexity: O(n)
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