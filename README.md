# img2zpl

[![gem](https://img.shields.io/gem/v/img2zpl)](https://rubygems.org/gems/img2zpl)
[![downloads](https://img.shields.io/gem/dt/img2zpl?color=brightgreen)](https://rubygems.org/gems/img2zpl)

Ruby library to convert images to usable &amp; printable ZPL code

### Installation

Add the gem to your Gemfile:
```
gem 'img2zpl'
```
And then run `bundle install`

Or install it yourself with:
```
gem install img2zpl
```

### Usage

```ruby
require 'img2zpl'

img = Img2Zpl::Image.open('foo.jpg')
zpl = img.to_zpl #=> "^FO0,0^GFA, ... ^FS"
```

### Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md)

#### [Changelog](CHANGELOG.MD)

### Copyright

Copyright &copy; 2019, [Michael King]() and [Contributors](CHANGELOG.md).

MIT License, see [LICENSE](https://github.com/mtking2/img2zpl/blob/master/LICENSE)
