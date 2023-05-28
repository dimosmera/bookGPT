require 'httparty'

# Uses Webhooks to post messages into Slack
class SlackAPI
  include HTTParty
  base_uri 'https://hooks.slack.com/services'

  # Use this to post a message to Slack
  def post_to_slack(message)
    response = self.class.post(ENV['SLACK_WEBHOOK_URL'], body: { 'text' => message }.to_json,
                                                         headers: { 'Content-Type' => 'application/json' })

    if response.success?
      puts "Just sent '#{message}' to Slack"
    else
      puts "Failed to send '#{message}' to Slack"
    end
  rescue HTTParty::Error => e
    puts "Error posting to Slack: #{e.message}"
    {}
  end
end
