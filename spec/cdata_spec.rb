require 'spec_helper'

describe RML::Element::DSL::CDATA do 
  context "Empty CDATA" do 
    subject { RML::Element::DSL::CDATA.new } 
    it { subject.to_s.should == "<![CDATA[]]>" }
  end

  context "With text for the CDATA" do
    subject { RML::Element::DSL::CDATA.new "Text goes here" }
    it { subject.to_s.should == "<![CDATA[Text goes here]]>" }
  end
end
