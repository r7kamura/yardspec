# Yardspec

[![test](https://github.com/r7kamura/yardspec/actions/workflows/test.yml/badge.svg)](https://github.com/r7kamura/yardspec/actions/workflows/test.yml)

Use YARD examples as RSepc examples.

```ruby
module Foo
  class Bar
    # @example returns "baz"
    #   expect(Foo::Bar.new.baz).to eq('baz')
    #
    # @example returns "bazbaz" for count 2
    #   expect(Foo::Bar.new.baz(count: 2)).to eq('bazbaz')
    #
    # @return [String]
    def baz(count: 1)
      'baz' * count
    end
  end
end
```

The code above is interpreted as follows:

```
$ bundle exec rspec

Foo::Bar#baz
  returns "baz"
  returns "bazbaz" for count 2

Finished in 0.00129 seconds (files took 0.087 seconds to load)
2 examples, 0 failures
```

## Installation

Install the gem and add to the application's Gemfile by executing:

```
bundle add yardspec
```

If bundler is not being used to manage dependencies, install the gem by executing:

```
gem install yardspec
```

## Usage

Require `"yardspec"` and then call `Yardspec.define_examples` as follows:

```ruby
# spec/spec_helper.rb
require 'yardspec'

Yardspec.define_examples
```

### Path glob

`Yardspec.define_examples` takes optional path glob as an argument.

If nothing is specified, the [default value of YARD](https://github.com/lsegal/yard/blob/0a550939f9b422f1bc4f46481749405284546ef9/lib/yard/parser/source_parser.rb#L69-L71) is used.

```ruby
Yardspec.define_examples(["{lib,app}/**/*.rb", "ext/**/*.{c,cc,cxx,cpp,rb}"])
```
