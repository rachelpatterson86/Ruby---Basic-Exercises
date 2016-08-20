# sorting algorithms. Yay!

# [8, 1, 7, 5, 9, 2, 0]

# # bubble sort: hard to read but don't want to delete.
# def bubble_1(numbers)
#   loop do
#     swapped = false
#     numbers.each_index do |n|
#       if numbers[n] > numbers[n + 1]
#         numbers[n], numbers[n + 1] = numbers[n + 1], numbers[n]
#         swapped = true
#       end
#       break if n == numbers.index(numbers.last) - 1
#     end
#     break unless swapped
#   end
#   numbers
# end

def bubble_2(numbers)
  loop do
    swapped = false
    (numbers.length - 1).times do |i|
      if numbers[i] > numbers[i + 1]
        numbers[i], numbers[i + 1] = numbers[i + 1], numbers[i]
        swapped = true
      end
    end
    break unless swapped
  end
  numbers
end

# merge sort = requires recursion... Is there a way NOT to use recursion???
def split_array(array)
  mid = (array.length / 2) - 1
  left_split = array[0..mid]
  right_split = array[mid + 1..-1]
  merge_sort(split_array(left_split), split_array(right_split))
  # merge_sort(left_split,right_split)
end

def merge_sort(left, right)
  sorted_array = []
  until left.empty? || right.empty?
    sorted_array << if left[0] > right[0]
                      right.shift
                    else
                      left.shift
                    end
  end
  sorted_array.concat(left).concat(right)
  sorted_array
end

# TODO: gnome sort
# TODO: insert sort
