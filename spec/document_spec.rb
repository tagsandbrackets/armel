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
  
  it "should define elements with text using short sintax" do
    doc.string {
      h1 "Hello World"
    }.should == "<h1>Hello World</h1>"
  end
  
  it "should define elements with text in outer and inner tag" do
    doc.string {
      div { 
        self << "Hello"
        h1 { self << "World" }
      }
    }.should == "<div>Hello<h1>World</h1></div>"
  end
  
  it "should define elements with attributes and text using short sintax" do
    doc.string {
      h1 "Hello World", id: 'foo', class: 'bar'
    }.should == "<h1 id='foo' class='bar'>Hello World</h1>"
  end
  
  it "should define nested elements" do
    doc.string {
      with_nested { 
        nested 
      }
    }.should == "<with_nested><nested /></with_nested>"
  end
  
  it "should define an element with attributes and nested element" do
    doc.string {
      with_nested(id: 'foo') { 
        nested 
      }
    }.should == "<with_nested id='foo'><nested /></with_nested>"
  end
  
  it "should define nested elements with attributes" do
    doc.string {
      form { 
        input id: 'foo', class: 'bar' 
      } 
    }.should == "<form><input id='foo' class='bar' /></form>"
  end  
end
