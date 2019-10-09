# coding: utf-8
$LOAD_PATH.push File.expand_path('lib', __dir__)
require 'img2zpl/version'

Gem::Specification.new do |spec|
  spec.name          = 'img2zpl'
  spec.version       = Img2Zpl::VERSION
  spec.authors       = ['Michael King']
  spec.email         = 'mtking1123@gmail.com'
  spec.summary       = 'Convert images to ZPL'
  spec.description   = 'Ruby library to convert images to usable & printable ZPL code'

  spec.homepage      = "https://github.com/mtking2/img2zpl"
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.test_files    = `git ls-files -- spec/*`.split("\n")
  spec.require_paths = ['lib']

  spec.add_dependency 'mini_magick', '~> 4.9'
  spec.add_development_dependency 'rake', '~> 13'
  spec.add_development_dependency 'rspec', '~> 3.9'
end
