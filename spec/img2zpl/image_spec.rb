require 'spec_helper'

describe Img2Zpl::Image do

  subject { described_class.open('spec/fixtures/default.jpg') }

  it 'inherits from the MiniMagick::Image class' do
    expect(described_class.respond_to?(:open)).to be true
    expect(described_class.respond_to?(:read)).to be true
    expect(subject.respond_to?(:zpl)).to be true
  end

  it 'zpl method returns a string' do
    expect(subject.zpl).to be_kind_of String
  end

end
