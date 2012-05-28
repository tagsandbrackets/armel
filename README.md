ARMEL - Ruby Markup Language
[![Build Status](https://secure.travis-ci.org/2hf/armel.png)](http://travis-ci.org/2hf/armel)
===

Minimalistic Ruby DSL to create XML

```ruby
ARMEL::Document.string { xml }
```

## Installation

    $ gem install armel

## Features

  * XML builder 
  * CDATA handler
  * Namespace for XML handler
  * High test coverage

## Philosophy 

  The ARMEL philosophy is to provide an small DSL for writting XML without
  the need to learn any new language. Ruby is a very rich and expressive
  language so the goal is to use it in everything including the creation
  of XML.

## Examples

```ruby
ARMEL::Document.string do
  contacts(group: "Personal") {
    contact(name: "Rafa") {
      numbers {
        home { self << "856-556-5445" }
        office { self << "856-556-5445" }
        mobil { self << "856-556-5445" }
      }
    }
    contact(name: "Omar") {
      numbers {
        home { self << "856-556-5445" }
        office { self << "856-556-5445" }
        mobil { self << "856-556-5445" }
      }
    }
  }
end
```

### Output
```xml
<?xml version="1.0" ?>
<contacts group="Personal">
  <contact name="Rafa">
    <numbers>
      <home>
        856-556-5445
      </home>
      <office>
        856-556-5445
      </office>
      <mobil>
        856-556-5445
      </mobil>
    </numbers>
  </contact>
  <contact name="Omar">
    <numbers>
      <home>
        856-556-5445
      </home>
      <office>
        856-556-5445
      </office>
      <mobil>
        856-556-5445
      </mobil>
    </numbers>
  </contact>
</contacts>
```

```ruby
ARMEL::Document.string do
  days = %w{ Sunday Monday Tuesday Wednesday Thursday Friday Saturday }
  
  weekdays {
    days.each do |d|
      day name: d
    end
  }
end
```

### Output
```xml
<?xml version="1.0" ?>
<weekdays>
  <day name="Sunday"/>
  <day name="Monday"/>
  <day name="Tuesday"/>
  <day name="Wednesday"/>
  <day name="Thursday"/>
  <day name="Friday"/>
  <day name="Saturday"/>
</weekdays>
```

## Contributing

* Fork the project
* Write spec 
* Make changes 
* Send pull request

## Contributors
``` 
Authors
  Omar Rodriguez
  Rafael George
```

## License
Copyright (c) 2012 Omar Rodriguez, Rafael George

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
