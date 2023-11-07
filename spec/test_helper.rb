def load_test_data
  # Users
    @user1 = User.create(username: 'user1', email: 'user1@example.com', password: 'password1')
    @user2 = User.create(username: 'user2', email: 'user2@example.com', password: 'password2')
    @user3 = User.create(username: 'user3', email: 'user3@example.com', password: 'password3')

  # Campaigns
    @campaign1 = @user1.campaigns.create(name: "Campaign 1",player_num: 5,  themes: ["Fantasy"])
    @campaign2 = @user2.campaigns.create(name: "Campaign 2",player_num: 3,  themes: ["Science Fiction"])
    @campaign3 = @user3.campaigns.create(name: "Campaign 3",player_num: 4,  themes: ["Mystery"])

    # Towns
    @town1 = @campaign1.towns.create(name: "Dimsdale", description: "A quaint little town...", leadership: "The mayor of Dimsdale", shops: "A hair solon", taverns: "the armoured duck")
    @town2 = @campaign2.towns.create(name: "Doomsdale", description: "A quiet little town...", leadership: "The mayor of Doomsdale", shops: "A nail solon", taverns: "the armoured goose")
    @town3 = @campaign3.towns.create(name: "Dimesdale", description: "A squat little town...", leadership: "The mayor of Dimesdale", shops: "A foot solon", taverns: "the armoured pheasant")

    # Npcs
    @npc1 = @campaign1.npcs.create!(name: "Elowen Swiftblade", gender: "Female", race: "Elf", klass: "Rogue", description: "A lithe and agile elf", attitude: "Mysterious")
    @npc2 = @campaign2.npcs.create!(name: "Thrain Ironshield", gender: "Male", race: "Dwarf", klass: "Cleric", description: "A stout and heavily armored dwarf ", attitude: "Gruff")
    @npc3 = @campaign3.npcs.create!(name: "Sylas Thornrider", gender: "Male", race: "Half-Elf", klass: "Bard", description: "A charismatic and charming half-elf", attitude: "Cheerful")
end