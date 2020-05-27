  def cash_received_from_customers
    CustomerStatistics.where(CNTYR: current_year).sum("AMTPAYMHC*-1")
  end
