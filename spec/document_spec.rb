require 'spec_helper'

describe RML::Document do
  let(:doc) { RML::Document }

  context "#create" do
    context "simple element" do
      specify do
        doc.string {
          mytag
        }.should == "<mytag />"
      end

      context "with attributes" do
        specify do
          doc.string {
            div id: 'foo', class: 'bar'
          }.should == "<div id='foo' class='bar' />" 
        end
      end
    end

    context "with text" do
      context "explicit sintax" do
        specify do
          doc.string {
            h1 { self << "Hello World" }
          }.should == "<h1>Hello World</h1>"
        end
      end
    end

    context "nested element" do
      specify do
        doc.string {
          with_nested { 
            nested 
          }
        }.should == "<with_nested><nested /></with_nested>"
      end
      
      context "with attributes" do
        specify do
          doc.string {
            form { 
              input id: 'foo', class: 'bar' 
            } 
          }.should == "<form><input id='foo' class='bar' /></form>"
        end
      end
    end
  end
end
