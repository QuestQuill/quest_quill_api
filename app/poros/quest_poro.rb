class QuestPoro
    attr_reader :name,
                :description,
                :goal
  
    def initialize(data)
      @name = parse_name(data)
      @description = parse_description(data)
      @goal = parse_goal(data)
    end
  
    private 
  
    def parse_name(whole_data)
      whole_data.match(/Name: ([^\n]+)/)[1]
    end
  
    def parse_description(whole_data)
      whole_data.match(/Description: ([^\n]+)/)[1]
    end

    def parse_goal(whole_data)
        whole_data.match(/Goal: ([^\n]+)/)[1]
    end
end