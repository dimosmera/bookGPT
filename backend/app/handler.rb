require 'matrix'
require 'csv'
require 'json'

require_relative 'openai'
require_relative 'utils/cosine_similarity'

def ask(event:, context:)
  request_body = JSON.parse(event['body'])

  embeddings_from_csv = []

  # Reads the local CSV file
  CSV.foreach('embeddings/i_have_no_mouth_and_i_must_scream.csv', headers: true, header_converters: :symbol) do |row|
    embeddings_from_csv << { text: row[:content], embedding: row[:embedding] }
  end

  user_query = request_body['question']
  puts user_query

  openai_api = OpenAI.new

  # Generates embeddings for the user query
  user_query_embeddings = openai_api.embeddings(user_query)
  query_embedding = Vector.elements(user_query_embeddings[0]['embedding'])
  puts query_embedding

  # Relates each embedding from the CSV with the user query one
  strings_and_relatednesses = embeddings_from_csv.map do |embedding|
    # Careful with using eval. It's okay here since we are in control of the input string
    [embedding[:text], 1 - cosine_similarity(query_embedding, Vector.elements(eval(embedding[:embedding])))]
  end

  # Sorts in descending order by relatedness
  sorted_strings_and_relatednesses = strings_and_relatednesses.sort_by { |item| -item[1] }

  # The 1st string will be the most relevant part of the book
  strings = sorted_strings_and_relatednesses.map(&:first)
  relatednesses = sorted_strings_and_relatednesses.map(&:last)

  relatednesses.each do |rel|
    puts rel
  end

  puts strings.first
  puts relatednesses.first

  answer = openai_api.completions(user_query, strings.first)
  puts answer

  {
    statusCode: 200,
    headers: {
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Credentials': true
    },
    body: {
      answer: answer
    }.to_json
  }
end
