require 'spec_helper'

describe Pickem::Week do
  it "should know what week of NFL football it is" do
    Pickem::Week.stub(:start_of_season_week).and_return(36) # Sep 8th, 2011 == 36th week of the year
    Time.stub(:now).and_return Time.parse('Oct 1, 2011')
    Pickem::Week.current_week.should == 4
  end
end
