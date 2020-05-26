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

def year_to_date_last_year
  Time.now.strftime("#{last_year}%m%d")
end

def ytd_net_sales_current_year
  SalesHistory.where("PERIOD <= ? AND YR = ?", Time.now.month, Time.now.year).sum('FAMTSALES - FRETSALES')
end

def ytd_net_sales_last_year
  SalesHistory.where("TRANDATE <= ? AND YR = ?", year_to_date_last_year, last_year).sum('FAMTSALES - FRETSALES')
end

def ytd_sales_diff
  ytd_net_sales_current_year - ytd_net_sales_last_year
end

def ytd_net_sales_month
  SalesHistory.where(PERIOD: Time.now.month, YR: Time.now.year).sum('FAMTSALES - FRETSALES')
end

def ytd_margin
  SalesHistory.where("PERIOD <= ? AND YR = ?", Time.now.month, Time.now.year).sum('FAMTSALES - FRETSALES - FCSTSALES')
end

def total_sales_last_year
  SalesHistory.where(YR: Time.now.year.to_i-1).sum('FAMTSALES - FRETSALES')
end
