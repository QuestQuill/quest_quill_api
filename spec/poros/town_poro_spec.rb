require 'rails_helper'

RSpec.describe NpcPoro do
  describe 'Town Poro' do
    let(:town_data) do
      "Name: Example Town
      Description: A picturesque town with a river.
      Leadership: Mayor John Smith
      Shops: General Store, Blacksmith
      Taverns: The Rusty Mug, The Golden Harp"
    end

    it 'parses town data' do
      subject = TownPoro.new(town_data)

      expect(subject).to be_a(TownPoro)

      expect(subject.name).to eq('Example Town')
      expect(subject.description).to eq('A picturesque town with a river.')
      expect(subject.leadership).to eq('Mayor John Smith')
      expect(subject.shops).to eq('General Store, Blacksmith')
      expect(subject.taverns).to eq('The Rusty Mug, The Golden Harp')
    end
  end
end
