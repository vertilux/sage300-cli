#require "sagecli/version"

def run
  welcome
  reports
end

def welcome
  welcome = Artii::Base.new
  puts Rainbow(welcome.asciify("Vertilux    CLI")).red
end

def menu
  CLI::UI::Prompt.ask('What report you want to display?') do |handler|
    handler.option('sales')  { |selection| selection }
    handler.option('order_action')     { |selection| selection }
    handler.option('cash_flow')   { |selection| selection }
    handler.option('upcomming_containers') { |selection| selection }
    handler.option('items_ranking') { |selection| selection }
  end
end

def reports
  case menu
  when "sales"
    CLI::UI::StdoutRouter.enable
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
      puts CLI::UI.fmt "{{v}} #{FriendlyNumbers.number_to_currency ytd_net_sales_month}"
    end

    CLI::UI::Frame.open('YTD Margin') do
      puts CLI::UI.fmt "{{v}} #{FriendlyNumbers.number_to_currency ytd_margin}"
    end

    CLI::UI::Frame.open('YTD Net Sales Last Year') do
      puts CLI::UI.fmt "{{v}} #{FriendlyNumbers.number_to_currency total_sales_last_year}"
    end
  when "order_action"
    puts "Order Action"
  end
end
