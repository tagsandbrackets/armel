require 'spec_helper'

describe RML::Attributes do
  let(:attrs) { RML::Attributes }  
  
  it "should be able to build attributes" do
    attrs.string(id: 'foo', title: 'bar').should == "id='foo' title='bar'"
  end
  
  it "should be able to build numeric attributes" do
    attrs.string(num: 1, text: 'foo').should == "num=1 text='foo'"
  end
  
  it "should be able to build attributes with namespace" do
    attrs.string(xmlns: { 
      h: "http://www.w3.org/TR/html4/", 
      r: "http://www.2hf.com/rml/" 
    }).should == "xmlns:h='http://www.w3.org/TR/html4/' xmlns:r='http://www.2hf.com/rml/'"
  end
end
