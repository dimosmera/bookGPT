require 'json'
require 'csv'

def ask(event:, context:)
  embeddings_from_csv = []

  # Reads the local CSV file
  CSV.foreach('embeddings/i_have_no_mouth_and_i_must_scream.csv', headers: true, header_converters: :symbol) do |row|
    embeddings_from_csv << { text: row[:content], embedding: row[:embedding] }
  end

  embeddings_from_csv.each do |embedding|
    puts embedding[:text]
    puts embedding[:embedding]
  end

  {
    statusCode: 200,
    body: {
      message: 'Go Serverless v1.0! Your function executed successfully!',
      input: event
    }.to_json
  }
end
