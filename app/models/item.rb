class Item < ActiveRecord::Base
  self.table_name  = 'ICITEM'
  self.primary_key = 'ITEMNO'
end
