module Api
  class PotatoPriceTimesController < ApplicationController
    def show
      date = parse_date(params[:day])
      return render json: { error: "Invalid date"}, status: :bad_request unless date

      prices = PotatoPriceTime.where(time: date.beginning_of_day..date.end_of_day).order(:time)

      render json: prices.as_json(only: [:time, :value])
    end

    private

    def parse_date(date)
      Date.parse(date) rescue nil
    end
  end
end
