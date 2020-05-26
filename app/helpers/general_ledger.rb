  def account_groups_description(code)
    case code
    when 10
      'Cash & Cash Equivalents'
    when 20
      'Accouts Receivable'
    when 30
      'Inventory'
    when 40
      'Other Current Assets'
    when 50
      'Fixed Assets'
    when 60
      'Accumulated Depreciation'
    when 70
      'Other Assets'
    when 80
      'Accounts Payable'
    when 90
      'Other Current Liabilities'
    when 100
      'Long Liabilities'
    when 110
      'Other Liabilities'
    when 120
      'Share Capital'
    when 130
      'Shareholders Equity'
    when 140
      'Revenue'
    when 150
      'Cost of Sales'
    when 160
      'Other Revenue'
    when 170
      'Other Expenses'
    when 180
      'Depreciation Expense'
    when 190 
      'Gains/Losses'
    when 200 
      'Interest Expense'
    when 210
      'Income Taxes'
    end
  end

  def fiscal_set(r, period, year)
    case period
    when '01'
      r.fiscal_sets.jan(year)
    when '02'
      r.fiscal_sets.feb(year)
    when '03'
      r.fiscal_sets.mar(year)
    when '04'
      r.fiscal_sets.apr(year)
    when '05'
      r.fiscal_sets.may(year)
    when '06'
      r.fiscal_sets.jun(year)
    when '07'
      r.fiscal_sets.jul(year)
    when '08'
      r.fiscal_sets.oug(year)
    when '09'
      r.fiscal_sets.sep(year)
    when '10'
      r.fiscal_sets.oct(year)
    when '11'
      r.fiscal_sets.nov(year)
    when '12'
      r.fiscal_sets.dec(year)
    when 'ob'
      r.fiscal_sets.open_balance(year)
    end
  end
