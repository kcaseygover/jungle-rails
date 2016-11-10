class Session < ActiveRecord::Base
  validates :email, uniqueness: true
end