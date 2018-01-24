vowels = {
  "a" => 0,
  "e" => 0,
  "i" => 0,
  "o" => 0,
  "u" => 0
}

i = 0

('a'..'z').each do |char|
  i += 1
  vowels[char] = i unless vowels[char].nil?  
end

puts vowels
