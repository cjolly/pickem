require 'spec_helper'

module Pickem::Scrapers
  describe CBSSports, vcr: {cassette_name: "cbs_sports"} do
    let(:scraper) { CBSSports.scrape! }

    it "knows it's source" do
      CBSSports.new.source.should == 'http://www.cbssports.com/nfl/odds'
    end

    context "scraped results" do
      it "should find 16 games" do
        scraper.games.size.should == 16
      end

      it "should rank MIA @ SF as the highest weighted game of the week" do
        scraper.picks.first.should == ['MIA', '*SF', '-10.5']
      end

      it "should rank BAL @ WAS as the lowest weighted game of the week" do
        scraper.picks.last.should == ['BAL', '*WAS', '-2.5']
      end

      it "should pick the away team if the line is positive" do
        scraper.picks[1].first.should == '*DEN'
      end
    end
  end
end
