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
    handler.option('Cash Flow')   { |selection| selection }
  end
end

def reports
  CLI::UI::StdoutRouter.enable
  while " "
    case menu
    when "sales"
      sales_dashboard
    when "order_action"
      order_action
    when "financial_statements"
      case statements
      when "Balance Sheet"
        balance_sheet
      when "Income Statement"
        income_statement
      when "Cash Flow"
        cash_flow
      end
    when "close"
      goodbye = Artii::Base.new
      puts Rainbow(goodbye.asciify("Good bye")).yellow
      break
    end
  end
end
