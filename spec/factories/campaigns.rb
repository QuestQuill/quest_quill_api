FactoryBot.define do
  factory :campaign do
    name { Faker::Games::DnD.title_name }
    player_num { 4 }
    themes { "Fantasy" }
  end
end
