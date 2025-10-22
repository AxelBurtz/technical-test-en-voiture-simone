module DateParsing
  extend ActiveSupport::Concern

  private

  def parse_date(param)
    Date.parse(param) rescue nil
  end
end
