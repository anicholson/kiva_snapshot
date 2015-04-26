class User < ActiveRecord::Base
  has_many :loan_users
  has_many :loans, through: :loan_users

  validates :name, presence: true
end
