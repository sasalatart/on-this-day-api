helpers do
  def valid_date_filter(day, month)
    return if (1..31).cover?(day.to_i) && (1..12).cover?(month.to_i)
    halt 400, json(error: 'Not a valid request.')
  end
end
