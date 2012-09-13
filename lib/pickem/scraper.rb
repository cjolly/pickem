require 'open-uri'
require 'nokogiri'

class Scraper
  NFL_BASE_URI = 'http://www.nfl.com/schedules/2012/REG'

  def self.go
    1.upto(17).each do |week|
      doc = Nokogiri::HTML(open("#{NFL_BASE_URI}/#{week}"))
      p doc
    end
  end
end
