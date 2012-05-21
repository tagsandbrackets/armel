require 'spec_helper'

describe RML::Element::DSL::Comment do 
  context "Empty comment" do 
    subject { RML::Element::DSL::Comment.new }
    it { subject.to_s.should == "<!--  -->" }
  end

  context "With comment text" do 
    subject { RML::Element::DSL::Comment.new "This is a comment" }
    it { subject.to_s.should == "<!-- This is a comment -->" }
  end
end
