$recursions = 0
def choose_pivot(array, left, right)
  first = array[left]
  middle = array[(right-left).floor]
  final = array[right]
  value_array = [first]
  if middle <= first
    value_array.unshift(middle)
  else
    value_array << middle
  end
  if final <= first
    value_array.unshift(final)
  else
    value_array << final
  end
  return value_array[1]
end
def partition_array(array, left, right)
  pivot_value = choose_pivot(array, left, right).to_i
  array[left], array[right] = array[right], array[left]
  store_index = left
  $recursions += right - left - 2
  (left..right-1).each do |i|
    if array[i].to_i < pivot_value
      array[i], array[store_index] = array[store_index], array[i]
      store_index = store_index + 1
    end
  end

  array[store_index], array[right] = array[right], array[store_index]
  return store_index
end

def inplace_quicksort(array, left, right)
  if left < right
    pivot_index = left.to_i
    new_pivot_index = partition_array(array, left, right)
    inplace_quicksort(array, left, new_pivot_index - 1)
    inplace_quicksort(array, new_pivot_index + 1, right)
  end

  return array
end

values = File.readlines("quick_sort.txt")
sorted_names = inplace_quicksort(values, 0, values.length - 1)
puts $recursions