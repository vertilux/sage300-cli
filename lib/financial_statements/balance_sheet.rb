def balance_sheet  
  CLI::UI::Frame.open('Balance Sheet') do
    table = TTY::Table.new do |t|
      # Current Assets
      total_current_assets=0
      t << ['Description', 'Amount']
      AccountGroups.current_assets.each do |r|
        total_current_assets = total_current_assets+fiscal_set(r, current_period, current_year)
        t << ["#{account_groups_description(r.GRPCOD)}", "#{FriendlyNumbers.number_to_currency fiscal_set(r, current_period, current_year)}"]
      end
      t << ['Total Current Assets', "#{FriendlyNumbers.number_to_currency total_current_assets}"]

      # Fixed Assets
      total_fixed_assets=0
      AccountGroups.fixed_assets.each do |r|
        total_fixed_assets = total_fixed_assets+fiscal_set(r, current_period, current_year)
        t << ["#{account_groups_description(r.GRPCOD)}", "#{FriendlyNumbers.number_to_currency fiscal_set(r, current_period, current_year)}"]
      end

      # Other Assets
      total_other_assets=0
      AccountGroups.other_assets.each do |r|
        total_other_assets = total_other_assets+fiscal_set(r, current_period, current_year)
        t << ["#{account_groups_description(r.GRPCOD)}", "#{FriendlyNumbers.number_to_currency fiscal_set(r, current_period, current_year)}"]
      end

      # Depreciation
      depreciation=0
      AccountGroups.depreciation.each do |r|
        depreciation = depreciation+fiscal_set(r, current_period, current_year)*-1
        t << ["#{account_groups_description(r.GRPCOD)}", "#{FriendlyNumbers.number_to_currency fiscal_set(r, current_period, current_year)}"]
      end
      total_assets = FriendlyNumbers.number_to_currency (total_current_assets+total_fixed_assets+total_other_assets-depreciation)
      t << ["#{CLI::UI.fmt '{{green:Total Assets}}'}", "#{CLI::UI.fmt '{{green:'+total_assets+'}}'}"]

      # Current Liabilities
      total_current_liabilities=0
      AccountGroups.current_liabilities.each do |r|
        total_current_liabilities = total_current_liabilities+fiscal_set(r, current_period, current_year)*-1
        t << ["#{account_groups_description(r.GRPCOD)}", "#{FriendlyNumbers.number_to_currency fiscal_set(r, current_period, current_year)*-1}"]
      end

      # Other Current Liabilities
      other_liabilities=0
      AccountGroups.other_liabilities.each do |r|
        other_liabilities = other_liabilities+fiscal_set(r, current_period, current_year)*-1
        t << ["#{account_groups_description(r.GRPCOD)}", "#{FriendlyNumbers.number_to_currency fiscal_set(r, current_period, current_year)*-1}"]
      end

      # Long Term Liabilities
      long_term_liabilities=0
      AccountGroups.long_term_liabilities.each do |r|
        long_term_liabilities = long_term_liabilities+fiscal_set(r, current_period, current_year)*-1
        t << ["#{account_groups_description(r.GRPCOD)}", "#{FriendlyNumbers.number_to_currency fiscal_set(r, current_period, current_year)*-1}"]
      end
      t << ['Total Liabilities', "#{FriendlyNumbers.number_to_currency (total_current_liabilities+other_liabilities+long_term_liabilities)}"]

      # Equity
      equity=0
      AccountGroups.equity.each do |r|
        equity = equity+fiscal_set(r, current_period, current_year)*-1
        t << ["#{account_groups_description(r.GRPCOD)}", "#{FriendlyNumbers.number_to_currency fiscal_set(r, current_period, current_year)*-1}"]
      end

      # Profit/Loss
      profit_loss=0
      AccountGroups.profit_loss.each do |r|
        profit_loss = profit_loss+fiscal_set(r, current_period, current_year)*-1
      end
      t << ['Profit/Loss', "#{FriendlyNumbers.number_to_currency profit_loss}"]
      liabilities_equity = FriendlyNumbers.number_to_currency (total_current_liabilities+other_liabilities+long_term_liabilities+equity+profit_loss)
      t << ["#{CLI::UI.fmt '{{green:Total Liabilities + Equity}}'}", "#{CLI::UI.fmt '{{green:'+liabilities_equity+'}}'}"]
    end
    table = table.render width: 80, resize: true, alignments: [:left, :right]
    puts table
  end
end
