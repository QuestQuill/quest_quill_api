class CreationFacade

  def new_town(message)
    service = ChatService.new
    response = service.generate_fantasy_object(message)

    TownPoro.new(response[:choices][0][:message][:content])
  end
end