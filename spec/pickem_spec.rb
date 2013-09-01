require 'spec_helper'

describe Pickem do
  before(:each) { stub_const('Pickem::FIRST_WEEK_OF_SEASON', 36)}

  context ".results", vcr: {cassette_name: "cbs_sports"} do
    it "returns a table of results" do
      table = Pickem.results
      table.should be_a(Terminal::Table)
      table.rows.size.should == 16
    end
  end

  context ".week" do
    it "knows the week of the season" do
      Pickem.current_week(Date.new(2012, 12, 8)).should == 14
    end

    it "should still consider monday the preceeding week of the season" do
      Pickem.current_week(Date.new(2012, 12, 10)).should == 14
    end

    it "tuesday becomes first day of the next week" do
      Pickem.current_week(Date.new(2012, 12, 11)).should == 15
    end

    it "handles weeks that extend into the new year" do
      Pickem.current_week(Date.new(2013, 1, 5)).should == 18
    end
  end
end
