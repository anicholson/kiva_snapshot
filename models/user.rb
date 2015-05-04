# encoding: utf-8

class User < ActiveRecord::Base
  has_many :loan_users
  has_many :loans, through: :loan_users

  validates :name, presence: true

  def self.next_loaner
    find(ENV['NEXT_LOANER'])
  rescue => e
    User.new(name: "We're…not sure?")
  end
end
