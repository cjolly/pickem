require 'spec_helper'

describe Pickem, vcr: {cassette_name: "cbs_sports"} do
  it "returns a table of results" do
    table = Pickem.results
    table.should be_a(Terminal::Table)
    table.rows.size.should == 16
  end
end
