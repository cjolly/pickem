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

      it "should rank NE @ BUF as the highest weighted game of the week" do
        scraper.picks.first.should == ["*NE", "BUF", "+10.5"]
      end

      it "should rank MIA @ CLE as the lowest weighted game of the week" do
        scraper.picks.last.should == ["*MIA", "CLE", "PK"]
      end
    end
  end
end
