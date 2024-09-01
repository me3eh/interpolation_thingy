# frozen_string_literal: true

module Colors
  class RangeService
    def initialize(color1:, color2:, amount:)
      @color1 = color1
      @color1_i = color_hash_to_array(color: color1)
      @color2 = color2
      @color2_i = color_hash_to_array(color: color2)
      @amount = amount
    end

    def call
      return [@color1] if @amount <= 1

      step_factor = (1 / (@amount - 1).to_f)

      new_color = []
      @amount.times.each do |i|
        color = []
        3.times do |index|
          color_part = interpolate_color(@color1_i[index], @color2_i[index], i * step_factor).to_i.to_s(16)
          color << two_os(color_part)
        end
        new_color << "##{color[0]}#{color[1]}#{color[2]}"
      end
      new_color
    end

    private

    def interpolate_color(color1, color2, factor)
      ((color2 - color1) * factor + color1).round
    end

    def two_os(number)
      return "0#{number}" if number.size == 1

      number
    end

    def color_hash_to_array(color:)
      [color[1..2].to_i(16), color[3..4].to_i(16), color[5..6].to_i(16)]
    end
  end
end
