FactoryBot.define do
  factory :campaign do
    name { Faker::Game.title }
    player_num { 4 }
    themes { Faker::Book.genre }
    user
  end
end
