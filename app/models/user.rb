class User < ActiveRecord::Base
  validates :name, presence:true
  validates :email, presence:true, uniqueness:true
  validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  validates :password, presence:true,
              length: {minimum: 8}
  has_secure_password

  has_and_belongs_to_many :courses
end
