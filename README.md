# img2zpl

[![gem](https://img.shields.io/gem/v/img2zpl?color=orange)](https://rubygems.org/gems/img2zpl)
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
zpl = img.to_zpl #=> "^GFA, ... ^FS"
```

#### Using ImageMagick commands

The `Img2Zpl::Image` class inherits from the `MiniMagick::Image` class provied by the [minimagick](https://github.com/minimagick/minimagick) gem. So you have the same control when it comes to modifying the image before converting to ZPL.

**Example**:
```ruby
img = Img2Zpl::Image.open('foo.png')

img.flatten
img.trim
img.resize '100x100'

zpl = img.to_zpl
```

#### Options

When calling the `.to_zpl` method there a number of optional parameters you can pass to further customize the resulting image:

- `black_threshold`: A value between 0 and 1 that sets the darkness threshold which determines how dark a pixel should be in order to become black in the resulting b/w image. Use larger value for a more saturated image and smaller value for a less saturated one. Default: `0.5`
- `invert`: set to `true` to invert which pixels are set to black and which are set to white.
- `compress`: set to `false` to not perform the ACSII compression in the resulting `^GF` string. For larger images the uncompressed string can become **very** long, so use caution.

**Example**:
```ruby
zpl = img.to_zpl black_threshold: 0.65, invert: true
```

### Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md)

#### [Changelog](CHANGELOG.md)

### Copyright

&copy; 2019, [Michael King](https://twitter.com/_mtking2) and [Contributors](CHANGELOG.md).

MIT License, see [LICENSE](https://github.com/mtking2/img2zpl/blob/master/LICENSE)
