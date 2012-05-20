require 'spec_helper'

describe RML::Document do
  let(:doc) { RML::Document }
  
  specify "Empty" do
    doc.string.should == ''
  end
  
  context "With elements" do
    specify "Single" do
      doc.string {
        xml
      }.should == "<xml />"
    end
    
    specify "Multiple" do
      doc.string {
        one
        two
      }.should == "<one /><two />"
    end
  end
end
