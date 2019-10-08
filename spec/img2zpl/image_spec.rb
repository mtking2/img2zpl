require 'spec_helper'

describe Img2Zpl::Image do

  subject { described_class.open('spec/fixtures/default.jpg') }

  it 'inherits from the MiniMagick::Image class' do
    expect(described_class.respond_to?(:open)).to be true
    expect(described_class.respond_to?(:read)).to be true
  end

end
