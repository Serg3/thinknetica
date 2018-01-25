puts "Enter 5 chars:"

arr_vowels = []

count = 0
loop do
  count += 1
  break if count > 5

  arr_vowels << gets.chomp
end

#arr_vowels = ['a', 'e', 'i', 'o', 'u']
hash_vowels = {}

('a'..'z').each_with_index { |char, index| hash_vowels[char] = index + 1 if arr_vowels.include? char }

puts hash_vowels
