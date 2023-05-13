require_relative 'extract_chunks'
require_relative 'OpenAI'

openai_api = OpenAI.new

chunks = extract_chunks

embeddings = openai_api.embeddings(chunks)
puts "embeddings: #{embeddings}"
