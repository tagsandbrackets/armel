require 'spec_helper'

describe RML::Document do
  let(:doc) { RML::Document }
  
  context "Single elmenet" do
    specify "Empty" do
      doc.string {
        mytag
      }.should == "<mytag />"
    end
    
    specify "With attributes" do
      doc.string {
        div id: 'foo', class: 'bar'
      }.should == "<div id='foo' class='bar' />" 
    end
    
    context "With text" do
      context "Explicit sintax" do
        specify "Explicit sintax" do
          doc.string {
            h1 { self << "Hello World" }
          }.should == "<h1>Hello World</h1>"
        end
      end
      
      context "Short sintax" do
        specify "Short sintax" do
          doc.string {
            h1 "Hello World"
          }.should == "<h1>Hello World</h1>"
        end
        
        specify "And attributes" do
          doc.string {
            h1 "Hello World", id: 'foo', class: 'bar'
          }.should == "<h1 id='foo' class='bar'>Hello World</h1>"
        end
      end
    end
  end
  
  context "Nest elements" do
    specify "Empty element" do
      doc.string {
        with_nested { 
          nested 
        }
      }.should == "<with_nested><nested /></with_nested>"
    end

    specify "Surrounded by text" do
      doc.string {
        sandwitch { 
          self << "bread"
          ham
          self << "bread"
        }
      }.should == "<sandwitch>bread<ham />bread</sandwitch>"
    end
    
    specify "With attributes and nested element" do
      doc.string {
        with_nested(id: 'foo') { 
          nested 
        }
      }.should == "<with_nested id='foo'><nested /></with_nested>"
    end
    
    specify "With attributes on the parent" do
      doc.string {
        form { 
          input id: 'foo', class: 'bar' 
        } 
      }.should == "<form><input id='foo' class='bar' /></form>"
    end  
  end
end
