require 'rails_helper'

RSpec.describe ChatService do
  describe '#generate_fantasy_object' do
    xit 'returns a response from the OpenAI' do
      message = "Once upon a time in Mordor..."

      VCR.use_cassette('openai_api_request') do
        response = chat_service.generate_fantasy_object(message)

        expect(response).to be_a(Hash)
        binding.pry
        expect(response[:response]).to eq("Generated text")
      end
    end
  end
end

