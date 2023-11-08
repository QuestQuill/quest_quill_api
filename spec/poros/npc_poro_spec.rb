require 'rails_helper'

RSpec.describe NpcPoro do
  describe 'Npc Poro' do
    let(:npc_data) do
      "Name: John
      Gender: Male
      Race: Human
      Class: Wizard
      Description: A wise old wizard.
      Attitude: Friendly"
    end

    it 'parses NPC data' do
      subject = NpcPoro.new(npc_data)

      expect(subject).to be_a(NpcPoro)

      expect(subject.name).to eq('John')
      expect(subject.gender).to eq('Male')
      expect(subject.race).to eq('Human')
      expect(subject.klass).to eq('Wizard')
      expect(subject.description).to eq('A wise old wizard.')
      expect(subject.attitude).to eq('Friendly')
    end
  end
end
