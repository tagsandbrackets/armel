require 'spec_helper'

describe RML::Document do
  specify "Empty" do
    described_class.define.should == ''
  end
  
  context "With elements" do
    specify "Single" do
      described_class.define {
        xml
      }.should == "<xml />"
    end
    
    specify "Multiple" do
      described_class.define {
        one
        two
      }.should == "<one /><two />"
    end
  end
end
