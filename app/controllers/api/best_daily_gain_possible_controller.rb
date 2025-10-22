module Api
  class BestDailyGainPossibleController < ApplicationController
    def show
      date = parse_date(params[:day])
      return render json: { error: "Invalid date"}, status: :bad_request unless date

      best_gain = calculate_best_daily_gain(date)
      best_gain2 = calculate(date)
      render json:  [best_gain_possible: best_gain,
      best_gain_possible2: best_gain2 ]
    end

    private

    def parse_date(date)
      Date.parse(date) rescue nil
    end

    def calculate_best_daily_gain(date)
      prices = PotatoPriceTime.where(time: date.beginning_of_day..date.end_of_day).order(:time).pluck(:value)

      return 0 if prices.empty?

      min_price = prices.first
      max_gain = 0.0

      prices.each do |price|
        potential_gain = (price - min_price) * 100
        max_gain = [max_gain, potential_gain].max
        min_price = [min_price, price].min
      end

      max_gain.round(2)
    end
  end
end
