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
        let(:campaign) { { name: 'foo', player_num: 42, themes: ['bar'] } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:campaign) { { name: 'foo' } }
        run_test!
      end
    end
  end

  path '/api/v1/users/:user_id/campaigns/{id}' do
    parameter name: :id, in: :path, type: :string
    get 'Retrieves a Campaign' do
      produces 'application/json'
    
      response '200', 'campaign found' do
        schema type: :object,
          properties: {
            id: { type: :integer },
            name: { type: :string },
            player_num: { type: :integer },
            themes: {
              type: :array,
              items: { type: :string }
            }
          },
          required: ['id', 'name', 'player_num', 'themes']
        
        let(:campaign) { create(:campaign, name: 'foo', player_num: 42, themes: ['bar']) }
        let(:id) { campaign.id }
        run_test!
      end
    
      response '404', 'campaign not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end
