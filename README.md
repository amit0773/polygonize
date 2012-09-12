# Polygonize

Any text convert to svg polygon coordinates
[![Build Status](https://secure.travis-ci.org/CloudifySource/cloudify.png)](http://travis-ci.org/CloudifySource/cloudify)

## Installation

Add this line to your application's Gemfile:

    gem 'polygonize'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install polygonize

## Usage

    include Polygonize
    ORIGINAL_TEXT.coordinates
    # => "x1,y1 x2,y2 x3,y3....."

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
