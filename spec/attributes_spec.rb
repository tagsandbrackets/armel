require 'spec_helper'

describe RML::Attributes do
  let(:attrs) { RML::Attributes }  
  
  it "should be able to build attributes" do
    attrs.string(id: 'foo', title: 'bar').should == "id='foo' title='bar'"
  end
end