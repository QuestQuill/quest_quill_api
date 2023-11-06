class NpcPoro
    attr_reader :name,
                :gender,
                :race,
                :klass,
                :description,
                :attitude
  
    def initialize(data)
      @name = parse_name(data)
      @gender = parse_gender(data)
      @race = parse_race(data)
      @klass = parse_klass(data)
      @description = parse_description(data)
      @attitude = parse_attitude(data)
    end
  
    private 
  
    def parse_name(whole_data)
      whole_data.match(/Name: ([^\n]+)/)[1]
    end
  
    def parse_gender(whole_data)
      whole_data.match(/Gender: ([^\n]+)/)[1]
    end
  
    def parse_race(whole_data)
      whole_data.match(/Race: ([^\n]+)/)[1]
    end
    
    def parse_klass(whole_data)
      whole_data.match(/Class: ([^\n]+)/)[1]
    end
  
    def parse_description(whole_data)
      whole_data.match(/Description: ([^\n]+)/)[1]
    end

    def parse_attitude(whole_data)
        whole_data.match(/Attitude: ([^\n]+)/)[1]
    end
end