# frozen_string_literal: true

module ColorHelper
  def contrast_color(hex)
    red, green, blue = color_hash_to_array(color: hex)
    binarization = (red * 299 + green * 587 + blue * 114) / 1000
    binarization > 128 ? "black" : "white"
  end

  private

  def color_hash_to_array(color:)
    [color[1..2].to_i(16), color[3..4].to_i(16), color[5..6].to_i(16)]
  end
end
