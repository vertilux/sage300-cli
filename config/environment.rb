require 'active_record'
require 'activerecord-sqlserver-adapter'
require 'require_all'
require 'cli/ui'
require 'artii'
require 'rainbow'
require 'friendly_numbers'

ActiveRecord::Base.establish_connection(
  adapter: "sqlserver",
  host: "10.255.4.20",
  database: "ACCLTD",
  username: "accpac",
  password: "vtx128wi*885787amil"
)

ActiveRecord::Base.logger = nil

require_all 'app/models'
require_all 'app/helpers'
require_all 'lib'
