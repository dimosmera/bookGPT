require 'httparty'

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

  # Asks ChatGPT
  def completions(query, context)
    body = {
      'messages' => [
        {
          'role' => 'system',
          'content' => 'You are a helpful assistant that accurately answers queries based on the text provided. Use this text to form your answer. Be accurate, helpful, concise, and clear.'
        },
        { 'role' => 'user', 'content' => context },
        { 'role' => 'user', 'content' => query }
      ],
      'model' => 'gpt-3.5-turbo'
    }
    headers = {
      'Content-Type' => 'application/json',
      'Authorization' => "Bearer #{ENV['OPENAI_API_KEY']}"
    }

    result = self.class.post(
      '/chat/completions',
      body: body.to_json,
      headers: headers
    )

    if result.success?
      puts result.parsed_response['usage']

      result.parsed_response['choices'][0]['message']['content']
    else
      puts "Failed to generate completions #{result.parsed_response}"
      []
    end
  rescue HTTParty::Error => e
    puts "Error generating completions: #{e.message}"
    []
  end
end
