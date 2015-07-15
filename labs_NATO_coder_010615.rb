# NATO ABC encoder/decoder

# Write your own NATO alphabet. There should be a function to encode and decode. The encode function will take a string replace all upper and lower case characters with their "NATO" equivalents and return the result. The decode function will take a string, replace the "NATO" characters with their normal letter form and return that. Non-alphabetical should be copied/stay the same in both cases.
# Hint 1: You will need a hash table.
#
# BONUS!
#
# Look at the wikipedia page for ROT-13. Try to write an encoder and decoder for ROT-13.

require 'pry'

alphabet = {
  "A"=>"alfa",
  "B"=>"bravo",
  "C"=>"charlie",
  "D"=>"delta",
  "E"=>"echo",
  "F"=>"foxtrot",
  "G"=>"golf",
  "H"=>"hotel",
  "I"=>"india",
  "J"=>"juliett",
  "K"=>"kilo",
  "L"=>"lima",
  "M"=>"mike",
  "N"=>"november",
  "O"=>"oscar",
  "P"=>"papa",
  "Q"=>"quebec",
  "R"=>"romeo",
  "S"=>"sierra",
  "T"=>"tango",
  "U"=>"uniform",
  "V"=>"victor",
  "W"=>"whiskey",
  "X"=>"x-ray",
  "Y"=>"yankee",
  "Z"=>"zulu"
}

def encoder(msg,alphabet)
  #msg = 'whatever is in lies'
  #blech = 'whatever is in alphabet'
  msg.each_char do |c|
    puts alphabet[c] #does something with c so needs to put c since we want to call each letter...
#    blech.each {|x,y| puts "#{x}, #{y}"} = no need because the value is already called...
  end
end

def decoder(msg,alphabet)
  #binding.pry
  msg.split.each do |b| #see ruby doc for strings. what gives me an array of words?
    puts alphabet.invert[b]
end
end

#encodeMe=encodeMe.chomp == encodeMe.chomp! these are the same.


puts "Would you like to send a secret message?"
lies = gets.upcase

puts "What would you like to decode?"
truth = gets.downcase

encoder(lies,alphabet)
decoder(truth, alphabet)
