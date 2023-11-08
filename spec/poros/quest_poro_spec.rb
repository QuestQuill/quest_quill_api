require 'rails_helper'

RSpec.describe QuestPoro do
  describe 'Quest Poro' do
    let(:quest_data) do
      "Name: Example Quest
      Description: A challenging quest in a mystical land.
      Goal: Retrieve the lost artifact."
    end

    it 'parses quest data' do
      subject = QuestPoro.new(quest_data)

      expect(subject).to be_a(QuestPoro)

      expect(subject.name).to eq('Example Quest')
      expect(subject.description).to eq('A challenging quest in a mystical land.')
      expect(subject.goal).to eq('Retrieve the lost artifact.')
    end
  end
end
