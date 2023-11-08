require 'swagger_helper'

RSpec.describe 'api/town', type: :request do
    path "/api/v1/users/:user_id/campaigns/:campaign_id/towns" do
      post 'Creates a Town' do
        tags 'Town'
        consumes 'application/json'
        parameter name: :town, in: :body, schema: {
          type: :object,
          properties: {
            name: { type: :string },
            description: { type: :string },
            leadership: { type: :string },
            taverns: { type: :string },
            shops: { type: :string }
          },
          required: ['name', 'description', 'leadership', 'taverns', 'shops']
        }
  
        response '200', 'town created' do
          let(:town) { { name: 'Tacoville', description: 'A town', leadership: 'Some Guy', taverns: 'The Lucky Duck', shops: 'Coffee shop' } }
          run_test!
        end
  
        response '422', 'invalid request' do
          let(:town) { { name: 'Tacoville' } }
          run_test!
        end
      end
    end
end
