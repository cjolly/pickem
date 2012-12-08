require 'open-uri'
require 'nokogiri'

module Pickem
  module Scrapers
    class CBSSports
      attr_reader :source, :games, :doc, :sorted_games

      def initialize
        @source = 'http://www.cbssports.com/nfl/odds'
        @games = []
        scrape_cbs_odds_page
        parse
      end

      def to_s
        sorted
      end

      def parse
        tables = @doc.css('table.data')
        tables.each do |table|
          rows = table.css('.row1')
          home_team = rows.first.css('a')[0]['href'].split('/')[4]
          away_team = rows.last.css('a')[0]['href'].split('/')[4]
          current_line = rows.last.css('td')[3].content

          if current_line.to_f < 0.0
            away_team = '*' + away_team
          else
            home_team = '*' + home_team
          end

          @games << [home_team, away_team, current_line]
        end
      end

      def sorted_games
        @games.sort_by {|game| game[2].to_f.abs}.reverse
      end

      private

      def scrape_cbs_odds_page
        @doc ||= Nokogiri::HTML(open(source))
      end
    end
  end
end
