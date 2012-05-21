require 'spec_helper'

describe RML::Element do
  context "Single elmenet" do
    specify "Empty" do
      described_class.string(:mytag).should == "<mytag />"
    end
    
    context "With attributes" do
      specify "With attributes" do
        described_class.string(:div, id: 'foo', class: 'bar')
          .should == "<div id='foo' class='bar' />" 
      end
      
      specify "And nested element" do
        described_class.string(:with_nested, id: 'foo') { 
          nested 
        }.should == "<with_nested id='foo'><nested /></with_nested>"
      end
    end
    
    context "With text" do
      context "Explicit sintax" do
        specify "Explicit sintax" do
          described_class.string(:h1) { self << "Hello World" }
            .should == "<h1>Hello World</h1>"
        end
      end
      
      context "Short sintax" do
        specify "Short sintax" do
          described_class.string(:h1, {}, "Hello World")
            .should == "<h1>Hello World</h1>"
        end
        
        specify "And attributes" do
          described_class.string(:h1, { id: 'foo', class: 'bar' }, "Hello World")
            .should == "<h1 id='foo' class='bar'>Hello World</h1>"
        end
      end
    end
    
    context "With CDATA" do
      specify "With CDATA" do
        described_class.string(:script) { 
          cdata! %{ alert('hi') }
        }.should == "<script><![CDATA[ alert('hi') ]]></script>"
      end
      
      specify "And nested elements" do
        described_class.string(:script) { 
          cdata! %{ alert('hi') }
          title
        }.should == "<script><![CDATA[ alert('hi') ]]><title /></script>"
      end
    end

    context "Comment creation" do 
      specify "Inside tags" do 
        described_class.string(:tag) { 
          comment! "This is a comment"
        }.should == "<tag><!-- This is a comment --></tag>"
      end
    end
  end
  
  context "Nest elements" do
    specify "Empty element" do
      described_class.string(:with_nested) { 
        nested 
      }.should == "<with_nested><nested /></with_nested>"
    end

    specify "Surrounded by text" do
      described_class.string(:sandwitch) { 
        self << "bread"
        ham
        self << "bread"
      }.should == "<sandwitch>bread<ham />bread</sandwitch>"
    end
    
    specify "With attributes" do
      described_class.string(:form) { 
        input id: 'foo', class: 'bar' 
      }.should == "<form><input id='foo' class='bar' /></form>"
    end  
  end
end
