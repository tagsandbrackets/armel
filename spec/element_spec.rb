require 'spec_helper'

describe Element do
  context "#create" do
    context "simple element" do
      subject { Element.new(:mytag).to_s }
      it { should be_eql "<mytag/>" }
    end
    
    context "nested element" do
      subject do 
        Element.new(:with_nested) {
          nested
        }.to_s
      end
      
      it { should == "<with_nested><nested/></with_nested>" }
    end
  end
end
