require 'rails_helper'

RSpec.describe 'User Create', type: :request do
  before(:each) do
    load_test_data
  end

  it 'Can Create a User' do
    user_params = ({
      username: "hiro_protagonist",
      email: "hiro@gmail.com",
      password: "password"
    })
    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/users", headers: headers, params: JSON.generate(user: user_params)

    new_user = User.last

    expect(response).to be_successful

    expect(response).to have_http_status(:ok)
    expect(response.content_type).to eq('application/json; charset=utf-8')
    expect(User.last.username).to eq('hiro_protagonist')
  end
end
