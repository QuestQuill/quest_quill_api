def load_test_data
  # Users
    @user1 = User.create(username: 'user1', email: 'user1@example.com', password: 'password1', token: "abcdefg", token_expiration: Time.now + 10.minutes)
    @user2 = User.create(username: 'user2', email: 'user2@example.com', password: 'password2', token: "hijklmn", token_expiration: Time.now + 7.minutes)
    @user3 = User.create(username: 'user3', email: 'user3@example.com', password: 'password3', token: "opqrstu", token_expiration: Time.now + 5.minutes)

  # Campaigns
    @campaign1 = @user1.campaigns.create(name: "Campaign 1",player_num: 5)
    @campaign2 = @user2.campaigns.create(name: "Campaign 2",player_num: 3)
    @campaign3 = @user3.campaigns.create(name: "Campaign 3",player_num: 4)

  # Themes
    @theme1 = Theme.create(name: "Fantasy")
    @theme2 = Theme.create(name: "High Magic")
    @theme3 = Theme.create(name: "Sci Fi")
    @theme4 = Theme.create(name: "Space Opera")
    @theme5 = Theme.create(name: "Low Magic")
    @theme6 = Theme.create(name: "Slice of Life")

  # Towns
    @town1 = @campaign1.towns.create(name: "Dimsdale", description: "A quaint little town...", leadership: "The mayor of Dimsdale", shops: "A hair solon", taverns: "the armoured duck")
    @town2 = @campaign2.towns.create(name: "Doomsdale", description: "A quiet little town...", leadership: "The mayor of Doomsdale", shops: "A nail solon", taverns: "the armoured goose")
    @town3 = @campaign3.towns.create(name: "Dimesdale", description: "A squat little town...", leadership: "The mayor of Dimesdale", shops: "A foot solon", taverns: "the armoured pheasant")

  # Npcs
    @npc1 = @campaign1.npcs.create!(name: "Elowen Swiftblade", gender: "Female", race: "Elf", klass: "Rogue", description: "A lithe and agile elf", attitude: "Mysterious")
    @npc2 = @campaign2.npcs.create!(name: "Thrain Ironshield", gender: "Male", race: "Dwarf", klass: "Cleric", description: "A stout and heavily armored dwarf ", attitude: "Gruff")
    @npc3 = @campaign3.npcs.create!(name: "Sylas Thornrider", gender: "Male", race: "Half-Elf", klass: "Bard", description: "A charismatic and charming half-elf", attitude: "Cheerful")

  # Quests
    @quest1 = @campaign1.quests.create!(name: "Rescue the Lost Heir", description: "The lost heir of the kingdom has been kidnapped by a group of nefarious bandits. The kingdom is in turmoil, and it's up to the adventurers to rescue the heir and bring peace back to the realm.", goal: "Locate the bandit's hideout, defeat the bandit leader, and safely return the heir to the royal palace.")
    @quest2 = @campaign2.quests.create!(name: "Retrieve the Legendary Relic", description: "Legends speak of a powerful artifact, the Sword of Eldrathil, hidden in the ancient tomb of the first king. It's said to possess immense magical powers. However, the tomb is filled with traps, undead guardians, and dark mysteries.", goal: "Navigate the treacherous tomb, overcome its challenges, and retrieve the Sword of Eldrathil before it falls into the wrong hands.")
    @quest3 = @campaign3.quests.create!(name: "The Singing Gourds Conspiracy", description: "The local gourds have started singing bizarre and cryptic songs at night. The villagers are perplexed and believe it's a sign of impending doom. The adventurers must decipher the meaning behind the singing gourds and prevent any potential catastrophe.", goal: "Investigate the gourds' strange behavior, understand their cryptic songs, and uncover the ancient and otherworldly secret behind the singing gourds to save the village from a surreal calamity.")
end