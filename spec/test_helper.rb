def load_test_data
  @users = create_list(:user, 2)
  @campaigns = create_list(:campaign, 3, user: @users.first)
  @towns = create_list(:town, 2, campaign: @campaigns.first)
end