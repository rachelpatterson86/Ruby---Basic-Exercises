# sorting algorithms. Yay!

arr = [8,1,7,5,9,2,0]

#bubble sort
def bubble_sort(array)
  loop do
    swapped = false
      array.each_index do |n|
        if array[n] > array[n+1]
          array[n], array[n+1] = array[n+1], array[n]
          swapped = true
        end
        break if n == array.index(array.last) - 1 #sometimes good to write out the value it symbolizes
      end
      print array
    break if not swapped
  end
  array
end


def bubble_sort(array)
  n = array.length
  loop do
    swapped = false
    (n-1).times do |i|
      if array[i] > array[i+1]
        array[i], array[i+1] = array[i+1], array[i]
        swapped = true #set to true its always true. doesnt get set back to false.
      end
    end
    print array
    break if not swapped
  end
  array
end

#merge sort = requires recursion... Is there a way NOT to use recursion???
def split_array(array)
  mid = (array.length/2) - 1
  left_split = array[0..mid]
  right_split = array[mid+1..-1]
  merge_sort(split_array(left_split),split_array(right_split))
  #merge_sort(left_split,right_split)
end

def merge_sort(left,right)
  sorted_array = []
  until left.empty? || right.empty? do
    if left[0] > right[0]
      sorted_array << right.shift
    else
      sorted_array << left.shift
    end
  end
    sorted_array.concat(left).concat(right)
    sorted_array
end

#TODO gnome sort
#TODO insert sort
