# NATO ABC encoder/decoder

# Write your own NATO abc. There should be a function to encode and decode. The encode function will take a string replace all upper and lower case characters with their "NATO" equivalents and return the result. The decode function will take a string, replace the "NATO" characters with their normal letter form and return that. Non-abcical should be copied/stay the same in both cases.
# Hint 1: You will need a hash table.
#
# BONUS!
#
# Look at the wikipedia page for ROT-13. Try to write an encoder and decoder for ROT-13.

require 'pry'

nato = [
  "alfa",
  "bravo",
  "charlie",
  "delta",
  "echo",
  "foxtrot",
  "golf",
  "hotel",
  "india",
  "juliett",
  "kilo",
  "lima",
  "mike",
  "november",
  "oscar",
  "papa",
  "quebec",
  "romeo",
  "sierra",
  "tango",
  "uniform",
  "victor",
  "whiskey",
  "x-ray",
  "yankee",
  "zulu"
]

#create a hash table from the abc array...

abc_hash = {}
def create_abc_hash(hash)
nato.each do |abc|
  hash[abc[0]] = abc
end

def encoder(msg,abc)
  msg.each_char do |c|
    puts abc[c]
  end
end

def decoder(msg,abc)
  msg.split.each do |b|
   puts abc.invert[b]
  end
end

puts "Enter message to encode or decode"
msg = gets.downcase

encoder(msg,abc_hash)
decoder(msg,abc_hash)
