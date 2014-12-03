def pretty_date(time)
   time.strftime("%d %b %Y")
end

def get_beginning_of_week(date)
  pretty_date(date.to_datetime.at_beginning_of_week.to_date)
end