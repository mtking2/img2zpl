# img2zpl
Ruby library to convert images to usable &amp; printable ZPL code

### Usage

```ruby
img = Img2Zpl::Image.open('foo.jpg')
zpl = img.zpl #=> "^FO0,0^GFA, ... ^FS"
```
