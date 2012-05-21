RML - Ruby Markup Language
===

Minimalistic Ruby DSL to create XML

```ruby
RML::Document.string { xml }
```

## Installation

    $ gem install rml

## Features

  * XML builder 
  * CDATA handler
  * Namespace for XML handler
  * High test coverage

## Philosophy 

  The RML philosophy is to provide an small DSL for writting XML without
  the need to learn any new language. Ruby is a very rich and expressive
  language so the goal is to use it in everything including the creation
  of XML.

## Examples

```ruby
require 'rubygems'
require 'rml'

RML::Document.string do
  xml
end
```
#### Output
```xml
<xml />
```

### Tag with attributes
```ruby
require 'rubygems'
require 'rml'

RML::Document.string(:tag, attribute: 'value') 
```

#### Output
```xml
<tag attribute='value' />
```

### Nested tags with attributes
```ruby
require 'rubygems'
require 'rml'

RML::Document.string(:tag, attribute:'value') do 
  nested
end
```

#### Output
```xml
<tag attribute='value'>
  <nested />
</tag>
```

### Text inside tags
```ruby
require 'rubygems'
require 'rml'

RML::Document.string(:tag) do 
  self << "Hello World"
end

# Shorter syntax
RML::Document.string(:tag, {}, "Hello World")
```

#### Output
```xml
<tag>Hello World</tag>
```

### Text and attributes
```ruby
require 'rubygems'
require 'rml'

RML::Document.string(:tag, { attribute: 'value', "Hello World")
```

#### Output
```xml
<tag attribute='value'>Hello World</tag>
```

### CDATA Support
```ruby
require 'rubygems'
require 'rml'

RML::Document.string(:script) do
  cdata! %{ alert('hi') }
end
```

#### Output
```xml
<script><![CDATA[alert('hi') ]]></script>
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
