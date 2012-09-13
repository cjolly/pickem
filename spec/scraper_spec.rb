require 'spec_helper'

describe Scraper do
  it "should scrape" do
    VCR.use_cassette('nfl') do
      Scraper.go
    end
  end
end
