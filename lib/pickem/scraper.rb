require 'open-uri'
require 'nokogiri'
require 'terminal-table'

class CBSOddsScraper
  attr_accessor :games, :doc

  def initialize
    @games = []
    scrape_cbs_odds_page
  end

  def go
    tables = @doc.css('table.data')
    tables.each do |table|
      rows = table.css('.row1')
      home_team = rows.first.css('a')[0]['href'].split('/')[4]
      away_team = rows.last.css('a')[0]['href'].split('/')[4]
      current_line = rows.last.css('td')[3].content
      @games << [home_team, away_team, current_line]
    end
    puts Terminal::Table.new :rows => @games.sort_by {|game| game[2].to_f.abs}.reverse
  end

  private

  def scrape_cbs_odds_page
    @doc = Nokogiri::HTML(open('http://www.cbssports.com/nfl/odds'))
  end
end

class Scraper
  PRO_FOOTBALL_REFERENCE_URL = 'http://www.pro-football-reference.com/years/2012/games.htm'
  def self.go
    doc = Nokogiri::HTML(open(PRO_FOOTBALL_REFERENCE_URL))

    # Week,Day,Date,,Winner/tie,,Loser/tie,PtsW,PtsL,YdsW,TOW,YdsL,TOL
    past_games_rows = doc.css('table#games tbody tr:not(.thead)')

    games = []
    # Week,Day,Date,VisTm,,HomeTm,Time
    upcoming_grames_rows = doc.css('table#games_left tbody tr:not(.thead)').each do |row|
      row = row.css('td')
      game = Game.new
      game.week = row[0].text
      game.scheduled_at = DateTime.parse("#{row[2].text}, #{row[6].text} Eastern")
      game.home_team = row[3].text
      game.visiting_team = row[5].text
      games << game
    end
    games
  end


  class Game
    attr_accessor :week
    attr_accessor :scheduled_at
    attr_accessor :visiting_team
    attr_accessor :visiting_team_score
    attr_accessor :home_team
    attr_accessor :home_team_score
  end

  class Season
    attr_accessor :year
  end

  class Team
    attr_accessor :year
    attr_accessor :full_name
  end
end
