def cash_flow
  CLI::UI::Frame.open('Cash Flow Statment') do
    table = TTY::Table.new do |t|
      t << ['Description', 'Amount']
      # Cash Received from Customers
      t << ['Cash Received from Customers', "#{FriendlyNumbers.number_to_currency cash_received_from_customers}"]

      # Cash Paid to Vendors
      paid_to_vendors=0
      cash_paid_to_vendors.each do |r|
        paid_to_vendors = paid_to_vendors + r.AMTINVPDHC
        t << ["(-) #{r.DESCRIPTN.humanize.titleize}", "#{FriendlyNumbers.number_to_currency r.AMTINVPDHC}"]
      end

      # Salaries
      salaries=0
      AccountGroups.salaries.each do |r|
        salaries = salaries+fiscal_set(r, current_period, current_year)
        t << ["(-) #{r.ACCTGRPDES}", "#{FriendlyNumbers.number_to_currency fiscal_set(r, current_period, current_year)}"]
      end

      # Interest
      interest=0
      AccountGroups.interest.each do |r|
        interest = interest+fiscal_set(r, current_period, current_year)
        t << ["(-) #{r.ACCTGRPDES}", "#{FriendlyNumbers.number_to_currency fiscal_set(r, current_period, current_year)}"]
      end

      # Net Cash
      net_cash = FriendlyNumbers.number_to_currency (cash_received_from_customers-paid_to_vendors-salaries-interest)
      t << ["#{CLI::UI.fmt '{{green:Net Cash from Operating Activities}}'}", "#{CLI::UI.fmt '{{green:'+net_cash+'}}'}"]
    end
    table = table.render width: 80, resize: true, alignments: [:left, :right]
    puts table
  end
end
