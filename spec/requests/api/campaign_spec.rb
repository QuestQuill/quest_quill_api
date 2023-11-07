require 'swagger_helper'

RSpec.describe 'api/campaign', type: :request do
  path "/api/v1/users/:user_id/campaigns" do
    post 'Creates a Campaign' do
      tags 'Campaign'
      consumes 'application/json'
      parameter name: :campaign, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          player_num: { type: :integer },
          themes: { type: :string }
        },
        required: ['name', 'player_num', 'themes']
      }

      response '200', 'campaign created' do
        let(:campaign) { { name: 'foo', player_num: 42, themes: 'bar' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:campaign) { { name: 'foo' } }
        run_test!
      end
    end
  end
end
