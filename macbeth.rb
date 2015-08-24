def open_macbeth
  filename = 'macbeth.txt' #'file_test.txt' ##for testing
  file = File.open(filename,'r+')
  remove_special_char(file)
end
#^ 30 min - a lot of trial and error in figuring out how to get the file integrated with the rest of the code.

#remove all special chars from words within string
def remove_special_char(line)
  line_new = ""
  line.each do |row|
    line_new += row.gsub(/[!.,?;]/,'') + ' '
  end
  remove_small_words(line_new)
end

#^ 10 mins

#remove all text < 4 chars
def remove_small_words(line)
line_new4 = ""
line_arr = line.split
line_arr.each do |row|
  if row.length > 4
    line_new4 += row + ' '
  end
end
second_most_frequent_word(line_new4)
end

#^12 mins

#get 2nd most frequent word from new text
# get a count of all the words in the text...
def second_most_frequent_word(line)
  line_arr = line.split
  line_hash = Hash.new(0)
  line_arr.each do |word|
    line_hash[word] += 1
  end
  ord =line_hash.sort_by { |k,v| v}.reverse
  puts ord[1]
  #puts ord.first(3)
end

#6 mins
open_macbeth
