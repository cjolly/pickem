require 'spec_helper'

module Pickem::Scrapers
  describe CBSSports, vcr: {cassette_name: "cbs_sports"} do
    let(:scraper) { CBSSports.new }

    it "knows it's source" do
      scraper.source.should == 'http://www.cbssports.com/nfl/odds'
    end

    it "should find 16 games" do
      scraper.games.size.should == 16
    end

    it "should rank MIA @ SF as the highest weighted game of the week" do
      scraper.sorted_games.first.should == ['MIA', '*SF', '-10.5']
    end

    it "should rank BAL @ WAS as the lowest weighted game of the week" do
      scraper.sorted_games.last.should == ['BAL', '*WAS', '-2.5']
    end

    it "should pick the away team if the line is positive" do
      scraper.sorted_games[1].first.should == '*DEN'
    end
  end
end
