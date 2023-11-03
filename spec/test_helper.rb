def load_test_data
  @users = create_list(:user, 2)
  @campaigns = create_list(:campaign, 3, user: @users.first)
  @campaign1 = create(:campaign)
  @towns = create_list(:town, 2, campaign: @campaign1)
end