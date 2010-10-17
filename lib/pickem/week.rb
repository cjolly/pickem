require 'open-uri'
require 'nokogiri'

module PickEm
  # espn_picks_page = 'http://espn.go.com/nfl/picks'
  # espn_projections_page = "http://insider.espn.go.com/nfl/projections?weekNumber=5&seasonType=2&seasonYear=2010"

  class Week
    attr_accessor :games, :week
    def initialize(week_number)
      @games = []
      @week = week_number.to_i
      parse_espn_projections
    end

    def sorted
      @games.sort_by {|g| [g.home.percent, g.away.percent].max }.reverse
    end

    def suggestions
      suggestions = []
      sorted.each_with_index do |g, i|
        suggestions << "#{16-i} - #{g.favorite}"
      end
      suggestions
    end

    private

      def parse_espn_projections
        espn_projections_page = "http://insider.espn.go.com/nfl/projections?weekNumber=#{@week}&seasonType=2&seasonYear=2010"

        doc = Nokogiri::HTML(open(espn_projections_page))
        scripts = doc.search('#my-teams-table script')

        accuscore_xml_links = scripts.collect{|s| s.to_s.match(/XMLURL=([^\&]*)/)[1] }
        accuscore_predictions = accuscore_xml_links.collect {|l| Nokogiri::XML(open(l)) }

        accuscore_predictions.each_with_index do |game, i|
          @games << PickEm::Game.new(game.search('//team'))
        end
      end

  end
end