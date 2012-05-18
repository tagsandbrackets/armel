require_relative 'spec_helper'

describe Element do
  describe "#create" do
    describe "simple element" do
      subject { Element.new(:mytag).to_s }
      it { must_equal "<mytag />" }

      describe "with attributes" do
        subject { Element.new(:div, id: 'foo', class: 'bar').to_s }
        it { should == "<div id='foo' class='bar' />" }
      end
    end

    describe "with text" do
      subject do
        Element.new(:h1) { self << "Hello World" }.to_s
      end

      it { should == "<h1>Hello World</h1>" }
    end

    describe "nested element" do
      subject do 
        Element.new(:with_nested) { nested }.to_s
      end

      it { should == "<with_nested><nested /></with_nested>" }
      
      describe "with attributes" do
        subject do 
          Element.new(:form) { input id: 'foo', class: 'bar' }.to_s
        end
        
        it { should == "<form><input id='foo' class='bar' /></form>" }
      end
    end
  end
end
