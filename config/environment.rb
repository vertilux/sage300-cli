require 'active_record'
require 'activerecord-sqlserver-adapter'
require 'require_all'

ActiveRecord::Base.establish_connection(
  adapter: "sqlserver",
  host: ENV['VERTILUX_DB_HOST'],
  database: ENV['VERTILUX_DB_NAME'],
  username: ENV['VERTILUX_DB_USERNAME'],
  password: ENV['VERTILUX_PASSWD']
)

ActiveRecord::Base.logger = nil

require_all 'app/models'
require_all 'lib'
