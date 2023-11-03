class ChatService

  def conn
    Faraday.new(
      url: "https://api.openai.com/v1/completions", 
        headers: {
          'Authorization' => "Bearer #{Rails.application.credentials.open_ai[:api_key]}",
          'Content-Type' => 'application/json'
        }
      )
  end

  def get_url(url, payload = nil)
    response = conn.post(url, payload)
    JSON.parse(response.body, symbolize_names: true)
  end

  def generate_fantasy_object(message)
    payload = {
      model: "gpt-3.5-turbo",
      max_tokens: 100,
      messages: [
        {
          role: "system",
          content: "You are a helpful assistant."
        },
        {
          role: "user",
          content: message
        }
      ]
    }.to_json

    get_url('/v1/chat/completions', payload)
  end
end
