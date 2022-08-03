# Yardspec

Use YARD examples as RSepc examples.

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
