def work_in_process_sparkline
  (10.days.ago.strftime("%Y%m%d")..Time.now.strftime("%Y%m%d")).map do |l|
    SalesOrdersLog.where("CONVERT(VARCHAR,created_at,112) >= ?", l).sum(:work_in_process_amount).to_i
  end
end

def backorders_sparkline
  (10.days.ago.strftime("%Y%m%d")..Time.now.strftime("%Y%m%d")).map do |l|
    SalesOrdersLog.where("CONVERT(VARCHAR,created_at,112) >= ?", l).sum(:backorder_amount).to_i
  end
end

def fullfilable_sparkline
  (10.days.ago.strftime("%Y%m%d")..Time.now.strftime("%Y%m%d")).map do |l|
    SalesOrdersLog.where("CONVERT(VARCHAR,created_at,112) >= ?", l).sum(:fulfillable_amount).to_i
  end
end

def open_orders_sparkline
  (10.days.ago.strftime("%Y%m%d")..Time.now.strftime("%Y%m%d")).map do |l|
    SalesOrdersLog.where("CONVERT(VARCHAR,created_at,112) >= ?", l).sum(:open_order_amount).to_i
  end
end

def order_action_table
  SalesOrdersLog.find_by_sql("
    SELECT CAST(created_at AS DATE) AS date,
      SUM(work_in_process_amount) AS wip,
      SUM(backorder_amount) AS backorder,
      SUM(fulfillable_amount) AS fullfilable,
      SUM(open_order_amount) AS open_orders
    FROM sales_order_logs
    WHERE CONVERT(VARCHAR,created_at,112) >= #{10.days.ago.strftime("%Y%m%d")}
    GROUP BY CAST(created_at AS DATE)
    ORDER BY CAST(created_at AS DATE) DESC
  ")
end

