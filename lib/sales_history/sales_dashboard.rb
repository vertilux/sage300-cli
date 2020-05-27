def sales_dashboard
  CLI::UI::Frame.open('YTD Net Sales Current Year') do
    if ytd_net_sales_current_year > ytd_net_sales_last_year
      puts CLI::UI.fmt "{{v}} #{FriendlyNumbers.number_to_currency ytd_net_sales_current_year}"
      puts CLI::UI.fmt "Diff Last Year {{green:#{FriendlyNumbers.number_to_currency ytd_sales_diff}}"
    else
      puts CLI::UI.fmt "{{x}} #{FriendlyNumbers.number_to_currency ytd_net_sales_current_year}"
      puts CLI::UI.fmt "Diff Last Year {{red:#{FriendlyNumbers.number_to_currency ytd_sales_diff}}}"
    end
  end

  CLI::UI::Frame.open('YTD Net Sales Current Month') do
    if ytd_month_current_year > ytd_month_last_year
      puts CLI::UI.fmt "{{v}} #{FriendlyNumbers.number_to_currency ytd_month_current_year}"
      puts CLI::UI.fmt "Diff Last Year {{green:#{FriendlyNumbers.number_to_currency ytd_month_diff}}"
    else
      puts CLI::UI.fmt "{{x}} #{FriendlyNumbers.number_to_currency ytd_month_current_year}"
      puts CLI::UI.fmt "Diff Last Year {{red:#{FriendlyNumbers.number_to_currency ytd_month_diff}}}"
    end
  end

  CLI::UI::Frame.open('YTD Margin') do
    if ytd_margin_current_year > ytd_margin_last_year
      puts CLI::UI.fmt "{{v}} #{FriendlyNumbers.number_to_currency ytd_margin_current_year}"
      puts CLI::UI.fmt "Diff Last Year {{green:#{FriendlyNumbers.number_to_currency ytd_margin_diff}}"
    else
      puts CLI::UI.fmt "{{x}} #{FriendlyNumbers.number_to_currency ytd_margin_current_year}"
      puts CLI::UI.fmt "Diff Last Year {{red:#{FriendlyNumbers.number_to_currency ytd_margin_diff}}}"
    end
  end

  CLI::UI::Frame.open('YTD Net Sales Last Year') do
    if ytd_net_sales_current_year > total_sales_last_year
      puts CLI::UI.fmt "{{v}} #{FriendlyNumbers.number_to_currency total_sales_last_year}"
      puts CLI::UI.fmt "Diff Net Sales {{green:#{FriendlyNumbers.number_to_currency net_sales_diff}}"
    else
      puts CLI::UI.fmt "{{x}} #{FriendlyNumbers.number_to_currency total_sales_last_year}"
      puts CLI::UI.fmt "Diff Net Sales {{red:#{FriendlyNumbers.number_to_currency net_sales_diff}}}"
    end
  end
end
