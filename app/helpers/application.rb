# current year
def current_year
  Time.now.in_time_zone('Eastern Time (US & Canada)').strftime("%Y")
end

def current_period
  Time.now.in_time_zone('Eastern Time (US & Canada)').strftime("%m")
end

def current_days
  (Time.now.to_date - Time.now.beginning_of_year.to_date).to_i
end

# last year
def last_year
  Time.now.strftime("%Y").to_i - 1
end

# YTD last year
def year_to_date_last_year
  Time.now.strftime("#{last_year}%m%d")
end
