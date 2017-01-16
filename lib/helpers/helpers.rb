helpers do
  def set_day_month
    valid_date_filter(params[:day].to_i, params[:month].to_i)
    @day_month = DayMonth.find_by(day: params[:day], month: params[:month])
  end

  def valid_date_filter(day, month)
    return if DayMonth.valid_date?(day, month)
    halt 400, json(error: 'Not a valid request.')
  end
end
