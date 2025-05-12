require "spec_helper"

describe Img2Zpl::Image do # rubocop:disable RSpec/SpecFilePathFormat
	subject(:image) { described_class.open("spec/fixtures/default.jpg") }

	it "inherits from the MiniMagick::Image class" do
		expect(described_class.respond_to?(:open)).to be true
		expect(described_class.respond_to?(:read)).to be true
	end

	it "implements the .to_zpl method" do
		expect(image.respond_to?(:to_zpl)).to be true
	end

	it "has the compression map" do # rubocop:disable RSpec/ExampleLength
		map = image.send(:_compression_map)
		expect(map).to eq({
			1 => "G",
			2 => "H",
			3 => "I",
			4 => "J",
			5 => "K",
			6 => "L",
			7 => "M",
			8 => "N",
			9 => "O",
			10 => "P",
			11 => "Q",
			12 => "R",
			13 => "S",
			14 => "T",
			15 => "U",
			16 => "V",
			17 => "W",
			18 => "X",
			19 => "Y",
			20 => "g",
			40 => "h",
			60 => "i",
			80 => "j",
			100 => "k",
			120 => "l",
			140 => "m",
			160 => "n",
			180 => "o",
			200 => "p",
			220 => "q",
			240 => "r",
			260 => "s",
			280 => "t",
			300 => "u",
			320 => "v",
			340 => "w",
			360 => "x",
			380 => "y",
			400 => "z"
		})
	end

	context "with example data" do
		let(:example_data_sets) {
			[
				{ data: "00000000000000000000000000000000000000000000000000000000008", result: "hX08" },
				{ data: "5555555555555ADDDDDDDDDDDDDDDDDDDDDDD", result: "S5AgID" },
				{ data: "00000000FFFFFFFFFFFFFFFFFFFFFFC0000000000000000000007FFFFFFFFF", result: "N0gHFCgG07OF" }
			]
		}

		it "properly compresses ASCII data" do
			example_data_sets.each do |data_set|
				data = data_set[:data]
				result = data_set[:result]
				image.send(:_compress, data)
				expect(data).to eq(result)
			end
		end
	end

	it "returns a string when calling .to_zpl" do
		expect(image.to_zpl).to be_a String
	end
end
