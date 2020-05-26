class Accounts < ActiveRecord::Base
  self.table_name  = 'GLAMF'
  self.primary_key = 'ACCTID'

  belongs_to :fiscal_sets, foreign_key: 'ACCTID'
  belongs_to :account_groups, foreign_key: 'ACCTGRPCOD', class_name: "AccountGroups"
  has_many :fiscal_sets, foreign_key: 'ACCTID', class_name: "FiscalSets"
end
