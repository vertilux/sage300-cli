class SalesHistory < ActiveRecord::Base
  self.table_name  = 'OESHDT'
  self.primary_key = 'ITEM'
end
