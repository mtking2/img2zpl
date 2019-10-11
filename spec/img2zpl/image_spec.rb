require 'spec_helper'

describe Img2Zpl::Image do

  subject { described_class.open('spec/fixtures/default.jpg') }

  it 'should inherit from the MiniMagick::Image class' do
    expect(described_class.respond_to?(:open)).to be true
    expect(described_class.respond_to?(:read)).to be true
    expect(subject.respond_to?(:to_zpl)).to be true
  end

  it 'should have the compression map' do
    map = subject.send(:_compression_map)
    expect(map[1]).to eq 'G'
    expect(map[2]).to eq 'H'
    expect(map[3]).to eq 'I'
    expect(map[4]).to eq 'J'
    expect(map[5]).to eq 'K'
    expect(map[6]).to eq 'L'
    expect(map[7]).to eq 'M'
    expect(map[8]).to eq 'N'
    expect(map[9]).to eq 'O'
    expect(map[10]).to eq 'P'
    expect(map[11]).to eq 'Q'
    expect(map[12]).to eq 'R'
    expect(map[13]).to eq 'S'
    expect(map[14]).to eq 'T'
    expect(map[15]).to eq 'U'
    expect(map[16]).to eq 'V'
    expect(map[17]).to eq 'W'
    expect(map[18]).to eq 'X'
    expect(map[19]).to eq 'Y'
    expect(map[20]).to eq 'g'
    expect(map[40]).to eq 'h'
    expect(map[60]).to eq 'i'
    expect(map[80]).to eq 'j'
    expect(map[100]).to eq 'k'
    expect(map[120]).to eq 'l'
    expect(map[140]).to eq 'm'
    expect(map[160]).to eq 'n'
    expect(map[180]).to eq 'o'
    expect(map[200]).to eq 'p'
    expect(map[220]).to eq 'q'
    expect(map[240]).to eq 'r'
    expect(map[260]).to eq 's'
    expect(map[280]).to eq 't'
    expect(map[300]).to eq 'u'
    expect(map[320]).to eq 'v'
    expect(map[340]).to eq 'w'
    expect(map[360]).to eq 'x'
    expect(map[380]).to eq 'y'
    expect(map[400]).to eq 'z'
  end

  it 'should properly compress ASCII data' do
    d1 = '00000000000000000000000000000000000000000000000000000000008'
    d2 = '5555555555555ADDDDDDDDDDDDDDDDDDDDDDD'
    d3 = '00000000FFFFFFFFFFFFFFFFFFFFFFC0000000000000000000007FFFFFFFFF'
    subject.send(:_compress, d1)
    subject.send(:_compress, d2)
    subject.send(:_compress, d3)
    expect(d1).to eq 'hX08'
    expect(d2).to eq 'S5AgID'
    expect(d3).to eq 'N0gHFCgG07OF'
  end

  it 'should return a string when calling .to_zpl' do
    expect(subject.to_zpl).to be_kind_of String
  end

end
