require 'spec_helper'

describe Element do
  describe "#create" do
    it "must generate a simple element" do
      subject = Element.new(:mytag).to_s
      subject.must_equal  "<mytag />"
    end

    it "must generate tag with attributes" do
      subject = Element.new(:div, id: 'foo', class: 'bar').to_s
      subject.must_equal "<div id='foo' class='bar' />"
    end

    it "must generate tag with inner text" do
      subject = Element.new(:h1) { self << "Hello World" }.to_s
      subject.must_equal "<h1>Hello World</h1>"
    end

    it "must generate tag with nested element" do
      subject = Element.new(:with_nested) { nested }.to_s
      subject.must_equal "<with_nested><nested /></with_nested>"
    end

    it "must generate tag with attributes" do
      subject = Element.new(:form) { input id: 'foo', class: 'bar' }.to_s
      subject.must_equal "<form><input id='foo' class='bar' /></form>"
    end
  end
end
