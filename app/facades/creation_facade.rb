class CreationFacade

  def new_town(message)
    service = ChatService.new
    town = service.generate_fantasy_object(message)
  end
end