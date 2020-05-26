require 'active_record'
require 'activerecord-sqlserver-adapter'
require 'require_all'
require 'cli/ui'
require 'artii'
require 'rainbow'
require 'friendly_numbers'
require 'sparkr'
require 'tty-table'

ActiveRecord::Base.establish_connection(
  adapter: "sqlserver",
  host: ENV['DB_HOST'],
  database: ENV['DB_NAME'],
  username: ENV['DB_USER'],
  password: ENV['DB_PASSWD']
)

ActiveRecord::Base.logger = nil

require_all 'app/models'
require_all 'app/helpers'
require_all 'lib'
