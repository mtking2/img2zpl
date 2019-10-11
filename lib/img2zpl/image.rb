class Img2Zpl::Image < MiniMagick::Image

  def to_zpl(black_threshold: 0.5, compress: true)
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

      data << if compress
        (line == previous_line ? ':' : line.gsub(/0+$/, ',').gsub(/F+$/, '!'))
      else
        line
      end

      previous_line = line
      line = ''
    end

    _compress(data) if compress
    "^GFA,#{byte_count},#{byte_count},#{bytes_per_row},#{data}^FS"
  end

  private

  def _compression_map
    map = {}
    start = 'G'.ord
    19.times { |i| map[i + 1] = (start+i).chr }
    start = 'g'.ord
    (20..400).step(20).each_with_index { |i, j| map[i] = (start+j).chr }
    map
  end

  def _reduce(n)
    str = ''
    counts = _compression_map.keys.sort.reverse
    counts.each do |c|
      if c <= n
        str << (_compression_map[c])
        n -= c
      end
    end
    str
  end

  def _compress(data)
    data.gsub!(/([\da-zA-Z])(\1+)/) do |m|
      "#{_reduce(m.length)}#{$1}"
    end
  end

end
