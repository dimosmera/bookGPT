require_relative 'extract_chunks'

chunks = extract_chunks

chunks.each do |chunk|
  puts '---------------------'

  puts chunk
  puts "chunk tokens: #{count_tokens(chunk)}"
end
