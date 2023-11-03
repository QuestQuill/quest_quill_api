def load_test_data

  # Users
    @user1 = User.create(username: 'user1', email: 'user1@example.com', password: 'password1')
    @user2 = User.create(username: 'user2', email: 'user2@example.com', password: 'password2')
    @user3 = User.create(username: 'user3', email: 'user3@example.com', password: 'password3')

  # Campaigns
    @campaign1 = @user1.campaigns.create(name: "Campaign 1",player_num: 5,  themes: "Fantasy" )
    @campaign2 = @user2.campaigns.create(name: "Campaign 2",player_num: 3,  themes: "Science Fiction")
    @campaign3 = @user3.campaigns.create(name: "Campaign 3",player_num: 4,  themes: "Mystery"  )

  # @users = create_list(:user, 2)
  # @campaigns = create_list(:campaign, 3, user: @users.first)
  # @campaign1 = create(:campaign)
end