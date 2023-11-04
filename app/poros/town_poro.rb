class TownPoro
  attr_reader :name,
              :description,
              :leadership,
              :shops,
              :taverns

  def initialize(data)
    @name = parse_name(data)
    @description = parse_description(data)
    @leadership = parse_leadership(data)
    @shops = parse_shops(data)
    @taverns = parse_taverns(data)
  end

  private 

  def parse_name(whole_data)
    whole_data.match(/Name: ([^\n]+)/)[1]
  end

  def parse_description(whole_data)
    whole_data.match(/Description: ([^\n]+)/)[1]
  end

  def parse_leadership(whole_data)
    whole_data.match(/Leadership: ([^\n]+)/)[1]
  end
  
  def parse_shops(whole_data)
    whole_data.match(/Shops: ([^\n]+)/)[1]
  end

  def parse_taverns(whole_data)
    whole_data.match(/Taverns: ([^\n]+)/)[1]
  end
end