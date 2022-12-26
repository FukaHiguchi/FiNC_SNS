class SimpleCalendar::MonthCalendar < SimpleCalendar::Calendar
  private

  def date_range
    @date = Date.current
    if params[:format] != nil
      @date = params[:format].to_date
    end
    beginning = @date.beginning_of_month.beginning_of_week
    ending    = @date.end_of_month.end_of_week
    (beginning..ending).to_a
  end
end