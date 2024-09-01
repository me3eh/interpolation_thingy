# frozen_string_literal: true

class ColdRainbowController < ApplicationController
  def index
    @first_color = "#196BDE"
    @second_color = "#CCE4FD"
    @amount = 10
    @colors = ::Colors::RangeService.new(color1: @first_color, color2: @second_color, amount: @amount).call
  end

  def reload
    @amount = params.dig(:cold_rainbow, :amount).to_i
    @amount = 10 if @amount.nil?

    @first_color = params.dig(:cold_rainbow, :first)
    @second_color = params.dig(:cold_rainbow, :second)

    @colors = ::Colors::RangeService.new(color1: @first_color, color2: @second_color, amount: @amount).call
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.update("main-page", partial: "cold_rainbow/reloading")
      end
    end
  end

  def reload_without_contrast
    @amount = params.dig(:cold_rainbow, :amount).to_i
    @amount = 10 if @amount.nil?

    @first_color = params.dig(:cold_rainbow, :first)
    @second_color = params.dig(:cold_rainbow, :second)

    @colors = ::Colors::RangeService.new(color1: @first_color, color2: @second_color, amount: @amount).call
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.update("main-page", partial: "cold_rainbow/reloading_without_contrast")
      end
    end
  end
end
