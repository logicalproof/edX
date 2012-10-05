# input: ['cars', 'for', 'potatoes', 'racs', 'four','scar', 'creams', 'scream'] 
# output: [ ["cars", "racs", "scar"],
#           ["four"],
#           ["for"],
#           ["potatoes"],
#           ["creams", "scream"] ]

# Write a method combine_anagrams(words) that, given an array of strings words, returns the array of 
# anagram groups formed from the input words. Case doesn't matter in classifying strings as anagrams (but 
# case should be preserved in the output), and the order of the anagrams in the groups doesn't matter.






def combine_anagrams(words)
  final = []
  first_word = ''
  b = ''
  words.each_with_index do |word_a, i|
    first_word = word_a.downcase.split('').sort
    final << [word_a]
    words.each_with_index do |word_b, j|
      if word_a == word_b
      else
        if first_word == word_b.downcase.split('').sort
          final[i] << word_b
          words.delete(word_b)
        else
        end
      end
    end
  end
  return final
end

# p combine_anagrams(['cars', 'for', 'potatoes', 'racs', 'four', 'four', 'Four', 'four', 'scar', 'creams', 'scream'])