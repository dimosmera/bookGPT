require 'httparty'

require_relative '../environment'

# Returns an array of embedding vectors using OpenAI API
def generate_embeddings(text)
  body = {
    'input' => text,
    'model' => 'text-embedding-ada-002'
  }
  headers = {
    'Content-Type' => 'application/json',
    'Authorization' => "Bearer #{ENV['OPENAI_API_KEY']}"
  }

  result = HTTParty.post(
    'https://api.openai.com/v1/embeddings',
    body: body.to_json,
    headers: headers
  )

  if result.success?
    puts result.parsed_response['usage']

    result.parsed_response['data']
  else
    puts "Failed to generate embeddings #{result.parsed_response}"
    []
  end
rescue HTTParty::Error => e
  puts "Error generating embeddings: #{e.message}"
  []
end
