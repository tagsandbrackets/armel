require 'spec_helper'

describe Element do
  context "#create" do
    context "simple element" do
      subject { Element.new(:mytag).to_s }
      it { should == "<mytag />" }

      context "with attributes" do
        subject { Element.new(:div, id: 'foo', class: 'bar').to_s }
        it { should == "<div id='foo' class='bar' />" }
      end
    end

    context "with text" do
      context "explicit sintax" do
        subject do
          Element.new(:h1) { self << "Hello World" }.to_s
        end

        it { should == "<h1>Hello World</h1>" }
      end
    end

    context "nested element" do
      subject do 
        Element.new(:with_nested) { nested }.to_s
      end

      it { should == "<with_nested><nested /></with_nested>" }
      
      context "with attributes" do
        subject do 
          Element.new(:form) { input id: 'foo', class: 'bar' }.to_s
        end
        
        it { should == "<form><input id='foo' class='bar' /></form>" }
      end
    end
  end
end
