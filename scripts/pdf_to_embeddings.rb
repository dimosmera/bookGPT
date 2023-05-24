require 'csv'

require_relative 'utils/extract_chunks'
require_relative 'utils/generate_embeddings'

chunks = extract_chunks

embeddings = chunks.map do |chunk|
  { text: chunk, embedding: generate_embeddings(chunk)[0]['embedding'] }
end

# Writes a CSV with exactly these named columns: "content", "embedding"
CSV.open('book_embeddings.csv', 'w') do |csv|
  csv << %w[content embedding]

  embeddings.each do |embedding|
    csv << [embedding[:text], embedding[:embedding]]
  end
end
