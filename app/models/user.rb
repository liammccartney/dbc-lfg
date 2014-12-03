class User < ActiveRecord::Base
  has_secure_password


  validates :name, presence: true

  validates :email, uniqueness: true
  validates :email, presence: true
  validates_format_of :email, {:with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/, :on => :create}

  has_many :groups
end
