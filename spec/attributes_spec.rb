require 'spec_helper'

describe ARMEL::Attributes do
  context "Build attributes string" do
    specify "Attributes list" do
      described_class.string(id: 'foo', title: 'bar').should == "id='foo' title='bar'"
    end
    
    specify "Numeric attributes" do
      described_class.string(num: 1, text: 'foo').should == "num=1 text='foo'"
    end
    
    specify "Ignore nil values" do
      described_class.string(id: nil, text: 'foo').should == "text='foo'"
    end
    
    specify "Object value" do
      described_class.string(val: Object.new).should match /^val='#<Object:.*'$/
    end
    
    context "With namespace" do
      specify "Single" do
        described_class.string(xmlns: { 
          h: "http://www.w3.org/TR/html4/", 
          r: "http://www.2hf.com/armel/" 
        }).should == "xmlns:h='http://www.w3.org/TR/html4/' xmlns:r='http://www.2hf.com/armel/'"
      end
      
      specify "Multiple" do
        described_class.string(h: { 
          id: 1, 
          class: 'foo' 
        }, armel: {
          test: 'yeah'
        }).should == "h:id=1 h:class='foo' armel:test='yeah'"
      end
    end
  end
end
