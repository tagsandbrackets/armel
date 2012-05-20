require 'spec_helper'

describe RML::Attributes do
  let(:attrs) { RML::Attributes }  
  
  context "Build attributes string" do
    specify "Attributes list" do
      attrs.string(id: 'foo', title: 'bar').should == "id='foo' title='bar'"
    end
    
    specify "Numeric attributes" do
      attrs.string(num: 1, text: 'foo').should == "num=1 text='foo'"
    end
    
    specify "Ignore nil values" do
      attrs.string(id: nil, text: 'foo').should == "text='foo'"
    end
    
    specify "Object value" do
      attrs.string(val: Object.new).should match /^val='#<Object:.*'$/
    end
    
    context "With namespace" do
      specify "Single" do
        attrs.string(xmlns: { 
          h: "http://www.w3.org/TR/html4/", 
          r: "http://www.2hf.com/rml/" 
        }).should == "xmlns:h='http://www.w3.org/TR/html4/' xmlns:r='http://www.2hf.com/rml/'"
      end
      
      specify "Multiple" do
        attrs.string(h: { 
          id: 1, 
          class: 'foo' 
        }, rml: {
          test: 'yeah'
        }).should == "h:id=1 h:class='foo' rml:test='yeah'"
      end
    end
  end
end
