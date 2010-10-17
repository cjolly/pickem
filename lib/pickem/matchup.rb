module PickEm
  class Matchup
    attr_accessor :teams, :home, :away
    def initialize(nokogiri_nodes)
      @teams = []
      @teams << PickEm::Team.new(nokogiri_nodes[0])
      @teams << PickEm::Team.new(nokogiri_nodes[1])

      @home = @teams.find {|t| t.home == "1"}
      @away = @teams.find {|t| t.home == "0"}
    end

    def to_s
      "#{@home} at #{@away}"
    end

    def favorite
      if @home.percent >= @away.percent
        @home
      else
        @away
      end
    end
  end
end