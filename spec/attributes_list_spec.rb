require 'spec_helper'

describe RML::AttributesList do
  let(:list) { RML::AttributesList }  
  
  it "should be able to build an attributes list string" do
    list.string(id: 'foo', title: 'bar').should == "id='foo' title='bar'"
  end
end
