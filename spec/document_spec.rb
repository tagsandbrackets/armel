require 'spec_helper'

describe RML::Document do
  let(:doc) { RML::Document }
  
  it "should define empty elements" do
    doc.string {
      mytag
    }.should == "<mytag />"
  end
  
  it "should define empty elements with attributes" do
    doc.string {
      div id: 'foo', class: 'bar'
    }.should == "<div id='foo' class='bar' />" 
  end
  
  it "should define elements with text using explicit sintax" do
    doc.string {
      h1 { self << "Hello World" }
    }.should == "<h1>Hello World</h1>"
  end
  
  it "should define nested elements" do
    doc.string {
      with_nested { 
        nested 
      }
    }.should == "<with_nested><nested /></with_nested>"
  end
  
  it "should define nested elements with attributes" do
    doc.string {
      form { 
        input id: 'foo', class: 'bar' 
      } 
    }.should == "<form><input id='foo' class='bar' /></form>"
  end 
end
