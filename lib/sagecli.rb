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
    handler.option('financial_statements')   { |selection| selection }
    handler.option('upcomming_containers') { |selection| selection }
    handler.option('items_ranking') { |selection| selection }
    handler.option('close') { |selection| selection }
  end
end

def statements
  CLI::UI::Prompt.ask('Choose Financial Statement') do |handler|
    handler.option('Balance Sheet')  { |selection| selection }
    handler.option('Income Statement')     { |selection| selection }
    handler.option('Cash FLow')   { |selection| selection }
  end
end

def reports
  CLI::UI::StdoutRouter.enable
  while " "
    case menu
    when "sales"
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
    when "order_action"
      CLI::UI::Frame.open('Work in Process') do
        loading_spiner
        wip = work_in_process_sparkline
        puts Sparkr.sparkline(wip)
      end

      CLI::UI::Frame.open('Backorders') do
        loading_spiner
        bo = backorders_sparkline
        puts Sparkr.sparkline(bo)
      end

      CLI::UI::Frame.open('Fullfilables') do
        loading_spiner
        full = fullfilable_sparkline
        puts Sparkr.sparkline(full)
      end

      CLI::UI::Frame.open('Open Orders') do
        loading_spiner
        oo = open_orders_sparkline
        puts Sparkr.sparkline(oo)
      end

      CLI::UI::Frame.open('Open Action Summary') do
        table = TTY::Table.new do |t|
          t << ['Date', 'Work in Process', 'Backorders', 'Fullfilable', 'Open Orders']
          order_action_table.each do |r|
            t << [
              r.date,
              "#{FriendlyNumbers.number_to_currency r.wip}",
              "#{FriendlyNumbers.number_to_currency r.backorder}",
              "#{FriendlyNumbers.number_to_currency r.fullfilable}",
              "#{FriendlyNumbers.number_to_currency r.open_orders}"
            ]
          end
        end
        table = table.render width: 80, resize: true, alignments: [:left, :right, :right, :right, :right]
        puts table
      end
    when "financial_statements"
      case statements
      when "Balance Sheet"
        balance_sheet
      when "Income Statement"
        puts "Income Statement"
      when "Cash Flow"
        puts "Cash Flow"
      end
    when "close"
      goodbye = Artii::Base.new
      puts Rainbow(goodbye.asciify("Good bye")).yellow
      break
    end
  end
end
