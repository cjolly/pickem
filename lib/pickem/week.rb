require 'open-uri'
require 'nokogiri'

module PickEm
  # espn_picks_page = 'http://espn.go.com/nfl/picks'
  # espn_projections_page = "http://insider.espn.go.com/nfl/projections?weekNumber=5&seasonType=2&seasonYear=2010"

  class Week
    attr_accessor :matchups, :week
    def initialize(week_number)
      @matchups = []
      @week = week_number.to_i
      parse_espn_projections
    end

    def sorted
      @matchups.sort_by {|m| [m.home.percent, m.away.percent].max }.reverse
    end

    def suggestions
      sorted.each_with_index {|m, i| puts "#{16-i} - #{m.favorite}"}
      #sorted.collect {|m| m.favorite.to_s }.join("\n")
    end

    private

      def parse_espn_projections
        espn_projections_page = "http://insider.espn.go.com/nfl/projections?weekNumber=#{@week}&seasonType=2&seasonYear=2010"

        doc = Nokogiri::HTML(open(espn_projections_page))
        scripts = doc.search('#my-teams-table script')

        accuscore_xml_links = scripts.collect{|s| s.to_s.match(/XMLURL=([^\&]*)/)[1] }
        accuscore_predictions = accuscore_xml_links.collect {|l| Nokogiri::XML(open(l)) }

        accuscore_predictions.each_with_index do |matchup, i|
          @matchups << PickEm::Matchup.new(matchup.search('//team'))
        end
      end

  end
end