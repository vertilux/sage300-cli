class FiscalSets < ActiveRecord::Base
  self.table_name  = 'GLAFS'
  self.primary_key = 'ACCTID'

  belongs_to :accounts, foreign_key: 'ACCTID', class_name: "Accounts"

  scope :open_balance, lambda { |year| where(FSCSYR: year, CURNTYPE: 'F', FSCSDSG: 'A').sum(:OPENBAL) }
  scope :jan, lambda { |year| where(FSCSYR: year, CURNTYPE: 'F', FSCSDSG: 'A').sum('OPENBAL+NETPERD1') }
  scope :feb, lambda { |year| where(FSCSYR: year, CURNTYPE: 'F', FSCSDSG: 'A').sum('OPENBAL+NETPERD1+NETPERD2') }
  scope :mar, lambda { |year| where(FSCSYR: year, CURNTYPE: 'F', FSCSDSG: 'A').sum('OPENBAL+NETPERD1+NETPERD2+NETPERD3') }
  scope :apr, lambda { |year| where(FSCSYR: year, CURNTYPE: 'F', FSCSDSG: 'A').sum('OPENBAL+NETPERD1+NETPERD2+NETPERD3+NETPERD4') }
  scope :may, lambda { |year| where(FSCSYR: year, CURNTYPE: 'F', FSCSDSG: 'A').sum('OPENBAL+NETPERD1+NETPERD2+NETPERD3+NETPERD4+NETPERD5') }
  scope :jun, lambda { |year| where(FSCSYR: year, CURNTYPE: 'F', FSCSDSG: 'A').sum('OPENBAL+NETPERD1+NETPERD2+NETPERD3+NETPERD4+NETPERD5+NETPERD6') }
  scope :jul, lambda { |year| where(FSCSYR: year, CURNTYPE: 'F', FSCSDSG: 'A').sum('OPENBAL+NETPERD1+NETPERD2+NETPERD3+NETPERD4+NETPERD5+NETPERD6+NETPERD7') }
  scope :aug, lambda { |year| where(FSCSYR: year, CURNTYPE: 'F', FSCSDSG: 'A').sum('OPENBAL+NETPERD1+NETPERD2+NETPERD3+NETPERD4+NETPERD5+NETPERD6+NETPERD7+NETPERD8') }
  scope :sep, lambda { |year| where(FSCSYR: year, CURNTYPE: 'F', FSCSDSG: 'A').sum('OPENBAL+NETPERD1+NETPERD2+NETPERD3+NETPERD4+NETPERD5+NETPERD6+NETPERD7+NETPERD8+NETPERD9') }
  scope :oct, lambda { |year| where(FSCSYR: year, CURNTYPE: 'F', FSCSDSG: 'A').sum('OPENBAL+NETPERD1+NETPERD2+NETPERD3+NETPERD4+NETPERD5+NETPERD6+NETPERD7+NETPERD8+NETPERD9+NETPERD10') }
  scope :nov, lambda { |year| where(FSCSYR: year, CURNTYPE: 'F', FSCSDSG: 'A').sum('OPENBAL+NETPERD1+NETPERD2+NETPERD3+NETPERD4+NETPERD5+NETPERD6+NETPERD7+NETPERD8+NETPERD9+NETPERD10+NETPERD11') }
  scope :dec, lambda { |year| where(FSCSYR: year, CURNTYPE: 'F', FSCSDSG: 'A').sum('OPENBAL+NETPERD1+NETPERD2+NETPERD3+NETPERD4+NETPERD5+NETPERD6+NETPERD7+NETPERD8+NETPERD9+NETPERD10+NETPERD11+NETPERD12') }
end
