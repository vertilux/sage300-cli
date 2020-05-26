class SalesOrdersLog < ActiveRecord::Base
  self.table_name  = 'sales_order_logs'
  self.primary_key = 'item'
end
