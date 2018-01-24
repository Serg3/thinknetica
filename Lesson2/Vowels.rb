vowels = {
  "a" => 0,
  "e" => 0,
  "i" => 0,
  "o" => 0,
  "u" => 0
}

i = 0

('a'..'z').each { |l|
  i += 1
  vowels[l] = i unless vowels[l].nil?  
}

puts vowels