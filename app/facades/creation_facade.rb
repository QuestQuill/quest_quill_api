class CreationFacade

  def new_town(message)
    service = ChatService.new
    response = service.generate_fantasy_object(message)

    TownPoro.new(response[:choices][0][:message][:content])
  end

  def new_npc(message)
    service = ChatService.new
    response = service.generate_fantasy_object(message)
    NpcPoro.new(response[:choices][0][:message][:content])
  end

  def new_quest(message)
    service = ChatService.new
    response = service.generate_fantasy_object(message)
    QuestPoro.new(response[:choices][0][:message][:content])
  end
end