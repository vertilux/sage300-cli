def order_action
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
end
