class AccountGroups < ActiveRecord::Base
  self.table_name  = 'GLACGRP'
  self.primary_key = 'ACCTGRPCOD'

  has_many :accounts, foreign_key: 'ACCTGRPCOD', class_name: "Accounts"
  has_many :fiscal_sets, :through => :accounts

  scope :active, -> { where.not(ACCTGRPCOD: '').order(ACCTGRPCOD: :asc) }

  # Assets
  scope :cash_equivalents, -> { where(GRPCOD: 10) }
  scope :current_assets, -> { where("GRPCOD IN (10,20,30,40)").order(GRPCOD: :asc) }
  scope :fixed_assets, -> { where("GRPCOD IN (50)").order(GRPCOD: :asc) }
  scope :other_assets, -> { where("GRPCOD IN (70)").order(GRPCOD: :asc) }
  scope :depreciation, -> { where("GRPCOD IN (60)").order(GRPCOD: :asc) }
  scope :inventory, -> { where("GRPCOD IN (30)").order(GRPCOD: :asc) }
  scope :accounts_receivable, -> { where("GRPCOD IN (20)").order(GRPCOD: :asc) }

  # Liabilities
  scope :current_liabilities, -> { where("GRPCOD IN (80,90)").order(GRPCOD: :asc) }
  scope :long_term_liabilities, -> { where("GRPCOD IN (100)").order(GRPCOD: :asc) }
  scope :other_liabilities, -> { where("GRPCOD IN (110)").order(GRPCOD: :asc) }

  # Equity
  scope :equity, -> { where("GRPCOD IN (120,130)").order(GRPCOD: :asc) }
  scope :profit_loss, -> { where("GRPCOD IN (140,150,160,170,180,190,200)").order(GRPCOD: :asc) }

  # Revenue
  scope :revenue, -> { where("GRPCOD IN (140,160)").order(GRPCOD: :asc) }

  # Cost of Sales
  scope :cost_of_sales, -> { where("GRPCOD IN (150)").order(GRPCOD: :asc) }

  # Expenses
  scope :expenses, -> { where("GRPCOD IN (170,180,190,200)").order(GRPCOD: :asc) }
  scope :salaries, -> { where(ACCTGRPCOD: '1700') }
  scope :interest, -> { where(GRPCOD: 200) }
end
