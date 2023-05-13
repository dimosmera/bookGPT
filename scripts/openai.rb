require 'httparty'

require_relative 'environment'

# Uses OpenAI for embeddings and completions
class OpenAI
  include HTTParty
  base_uri 'https://api.openai.com/v1'

  # Returns an array of embedding vectors
  def embeddings(array_of_texts)
    body = {
      'input' => array_of_texts,
      'model' => 'text-embedding-ada-002'
    }
    headers = {
      'Content-Type' => 'application/json',
      'Authorization' => "Bearer #{ENV['OPENAI_API_KEY']}"
    }

    result = self.class.post(
      '/embeddings',
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
end
