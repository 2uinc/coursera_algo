$inversions = 0
def merge(left, right)
  sorted_array = []
  until left.length == 0 || right.length == 0
    if left[0] <= right[0]
      sorted_array << left.shift
    else
      sorted_array << right.shift
      $inversions += left.length
    end
  end
  sorted_array = sorted_array + left + right
    return sorted_array
end

def divide_and_sort(array)
  return array if array.length <= 1
  if array.length >= 2
    midpoint = array.length/2.floor
    left_array = array[0...midpoint]
    right_array = array[midpoint..-1]
    left = divide_and_sort(left_array)
    right = divide_and_sort(right_array)
    merge(left, right)
  end
end

File.open("./inversions.txt", "r") do |file|
  original_array = []
  file.each_line do |line|
    original_array << line.to_i
  end
  final_array_and_count = divide_and_sort(original_array)
  puts $inversions
end