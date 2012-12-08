require 'rubygems'
require 'bundler/setup'

require 'pickem/scrapers/cbs_sports'
require 'terminal-table'

module Pickem
  def self.results
    scraper = Scrapers::CBSSports.scrape!
    table = Terminal::Table.new({
      title: scraper.source,
      headings: ['Away', 'Home', 'Current Line'],
      rows: scraper.picks
    })

    table.align_column(2, :right)
    table
  end
end
