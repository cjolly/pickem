require 'spec_helper'

describe "Truth" do
  it "should be true" do
    true.should be_true
  end
  
  it "should be false" do
    false.should be_false
  end
end