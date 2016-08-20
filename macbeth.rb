def get_2nd_most_frequent_word_from_fime(filename)
  file = File.open(filename, 'r+')
  long_words_no_special_chars = remove_special_char_and_short_words(file)
  puts second_most_frequent_word_from_file(long_words_no_special_chars)
end

# remove all special chars and words less than 4 characters within string
def remove_special_char_and_short_words(lines)
  long_words_no_special_chars = ''

  lines.each do |line|
    line.gsub(/[^a-zA-Z\s]/, '').split.each do |word|
      long_words_no_special_chars += (word.downcase + ' ') if word.length > 4
    end
  end
  long_words_no_special_chars
end

# get 2nd most frequent word from modified text
def second_most_frequent_word_from_file(modified_lines)
  words_and_frequency = Hash.new(0)
  modified_lines.split.each do |word|
    words_and_frequency[word] += 1
  end
  words_and_frequency.sort_by { |_k, v| v }.reverse[1][0]
end

get_2nd_most_frequent_word_from_fime('macbeth.txt')
