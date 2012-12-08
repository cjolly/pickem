require 'rubygems'
require 'bundler/setup'

require 'pickem/scrapers/cbs_sports'
require 'terminal-table'

module Pickem
  def self.print_picks
    scraper = Scrapers::CBSSports.new
    table = Terminal::Table.new({
      title: scraper.source,
      headings: ['Away', 'Home', 'Current Line'],
      rows: scraper.sorted_games
    })

    table.align_column(2, :right)
    puts table
  end
end
