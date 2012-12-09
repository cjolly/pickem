require 'rubygems'
require 'bundler/setup'

require 'pickem/scrapers/cbs_sports'
require 'terminal-table'
require 'date'

module Pickem
  FIRST_WEEK_OF_SEASON = 36

  def self.results
    scraper = Scrapers::CBSSports.scrape!
    table = Terminal::Table.new({
      title: "Week #{current_week}\n#{scraper.source}",
      headings: ['Away', 'Home', 'Current Line'],
      rows: scraper.picks
    })

    table.align_column(2, :right)
    table
  end

  def self.current_week(today = Date.today)
    week = today.cweek - FIRST_WEEK_OF_SEASON
    week += 1 unless today.monday?
    week
  end
end
