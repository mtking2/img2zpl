class Img2Zpl::Image < MiniMagick::Image

  def to_zpl(black_threshold: 0.5)
    bytes_per_row = (width % 8).positive? ? (width / 8) + 1 : (width / 8)
    byte_count = bytes_per_row * height
    data, line, previous_line, byte = '', '', '', ''

    get_pixels.each do |row|

      row.each_with_index do |column, i|
        r, g, b = column.map(&:to_i)
        byte << ((r + g + b) > (black_threshold * 765) ? '0' : '1')
        if (i % 8).zero?
          line << byte.to_i(2).to_s(16).upcase.rjust(2, '0')
          byte = ''
        end
      end
      data << (line == previous_line ? ':' : line.gsub(/0+$/, ',').gsub(/F+$/, '!'))
      previous_line = line
      line = ''
    end

    "^FO0,0^GFA,#{byte_count},#{byte_count},#{bytes_per_row},#{data}^FS"
  end

  private

  def _compression_map
    # TODO: finish compression map
  end

end
