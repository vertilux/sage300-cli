def income_statement
  CLI::UI::Frame.open('Income Statment') do
    table = TTY::Table.new do |t|
      # Revenue
      revenue=0
      t << ['Description', 'Amount']
      AccountGroups.revenue.each do |r|
        revenue = revenue+fiscal_set(r, current_period, current_year)*-1
        t << ["#{account_groups_description(r.GRPCOD)}", "#{FriendlyNumbers.number_to_currency fiscal_set(r, current_period, current_year)*-1}"]
      end

      # Cost of Good Solds
      cogs=0
      AccountGroups.cost_of_sales.each do |r|
        cogs = cogs+fiscal_set(r, current_period, current_year)
        t << ["#{account_groups_description(r.GRPCOD)}", "#{FriendlyNumbers.number_to_currency fiscal_set(r, current_period, current_year)}"]
      end
  
      # Gross Profit
      gp = FriendlyNumbers.number_to_currency (revenue-cogs)
      t << ["#{CLI::UI.fmt '{{green:Gross Profit}}'}", "#{CLI::UI.fmt '{{green:'+gp+'}}'}"]

      # Expenses
      expenses=0
      AccountGroups.expenses.each do |r|
        expenses = expenses+fiscal_set(r, current_period, current_year)
        t << ["#{r.ACCTGRPDES}", "#{FriendlyNumbers.number_to_currency fiscal_set(r, current_period, current_year)}"]
      end

      # Net Income/Loss
      income_loss = FriendlyNumbers.number_to_currency (revenue-cogs-expenses)
      t << ["#{CLI::UI.fmt '{{green:Net Income (Loss)}}'}", "#{CLI::UI.fmt '{{green:'+income_loss+'}}'}"]
    end
    table = table.render width: 80, resize: true, alignments: [:left, :right]
    puts table
  end
end
