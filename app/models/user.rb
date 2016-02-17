class User < ActiveRecord::Base
  validates :name, presence:true
  validates :email, presence:true, uniqueness:true
  validates :password, presence:true,
              length: {minimum: 8}
  has_secure_password

  has_and_belongs_to_many :courses
end
