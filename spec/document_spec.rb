require 'spec_helper'

describe ARMEL::Document do
  specify "Empty" do
    described_class.string.should == ''
  end
  
  context "With elements" do
    specify "Single" do
      described_class.string {
        xml
      }.should == "<xml />"
    end
    
    specify "Multiple" do
      described_class.string {
        one
        two
      }.should == "<one /><two />"
    end
  end
end
