#require 'active_record'
require 'activerecord-sqlserver-adapter'
require './config/environment'

class Item < ActiveRecord::Base
  self.table_name  = 'ICITEM'
  self.primary_key = 'ITEMNO'
end
