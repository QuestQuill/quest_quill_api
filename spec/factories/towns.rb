FactoryBot.define do
  factory :town do
    name { Faker::Fantasy::Tolkien.location }
    description { "A quaint little farming hamlet, where they trade their crops for the and fine wool to the nearby kingdom. A garrison of guards of said kingdom have an outpost in this town, though they have not true jurisdiction here, they still disuade would be raiders." }
    leadership { Faker::Games::DnD.first_name }
    taverns { Faker::Games::Witcher.book }
    shops { Faker::Company.name }
    campaign
  end
end
