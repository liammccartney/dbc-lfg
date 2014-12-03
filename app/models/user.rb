class User < ActiveRecord::Base
  has_secure_password


  validates :name, presence: true

  valdates :email, uniqeness: true
  valdates :email, presence: true
  validates_format_of :email, {:with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/, :on => :create}
end
