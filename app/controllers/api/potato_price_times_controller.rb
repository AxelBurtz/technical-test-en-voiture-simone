module Api
  class PotatoPriceTimesController < ApplicationController
    include DateParsing

    def show
      date = parse_date(params[:day])
      return render json: { error: "Invalid date"}, status: :bad_request unless date

      prices = PotatoPriceTime.where(time: date.beginning_of_day..date.end_of_day).order(:time)

      render json: prices.as_json(only: [:time, :value])
    end
  end
end
