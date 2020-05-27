# YTD Net Sales
def ytd_net_sales_current_year
  SalesHistory.where("PERIOD <= ? AND YR = ?", Time.now.month, Time.now.year).sum('FAMTSALES - FRETSALES')
end

def ytd_net_sales_last_year
  SalesHistory.where("TRANDATE <= ? AND YR = ?", year_to_date_last_year, last_year).sum('FAMTSALES - FRETSALES')
end

def ytd_sales_diff
  ytd_net_sales_current_year - ytd_net_sales_last_year
end

# Monthly Sales
def ytd_month_current_year
  SalesHistory.where(PERIOD: Time.now.month, YR: Time.now.year).sum('FAMTSALES - FRETSALES')
end

def ytd_month_last_year
  SalesHistory.where("TRANDATE <= ? AND PERIOD = ? AND YR = ?", year_to_date_last_year, Time.now.month, Time.now.year.to_i-1).sum('FAMTSALES - FRETSALES')
end

def ytd_month_diff
  ytd_month_current_year - ytd_month_last_year
end

# Margin
def ytd_margin_current_year
  SalesHistory.where("PERIOD <= ? AND YR = ?", Time.now.month, Time.now.year).sum('FAMTSALES - FRETSALES - FCSTSALES')
end

def ytd_margin_last_year
  SalesHistory.where("TRANDATE <= ? AND YR = ?", year_to_date_last_year, Time.now.year.to_i-1).sum('FAMTSALES - FRETSALES - FCSTSALES')
end

def ytd_margin_diff
  ytd_margin_current_year - ytd_margin_last_year
end

# Total Sales
def total_sales_last_year
  SalesHistory.where(YR: Time.now.year.to_i-1).sum('FAMTSALES - FRETSALES')
end

def net_sales_diff
  ytd_net_sales_current_year - total_sales_last_year
end
