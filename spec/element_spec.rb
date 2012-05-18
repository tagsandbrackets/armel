require 'spec_helper'

describe Element do
  context "#create" do
    context "simple element" do
      specify { Element.new(:mytag).to_s.should == "<mytag />" }

      context "with attributes" do
        specify do 
          Element.new(:div, id: 'foo', class: 'bar').to_s.should == "<div id='foo' class='bar' />"
        end
      end
    end

    context "with text" do
      context "explicit sintax" do
        specify do 
          Element.new(:h1) { self << "Hello World" }.to_s.should == "<h1>Hello World</h1>"
        end
      end
    end

    context "nested element" do
      specify do 
        Element.new(:with_nested) { nested }.to_s.should == "<with_nested><nested /></with_nested>"
      end
      
      context "with attributes" do
        specify do 
          Element.new(:form) { input id: 'foo', class: 'bar' }.to_s.should == "<form><input id='foo' class='bar' /></form>"
        end
      end
    end
  end
end
