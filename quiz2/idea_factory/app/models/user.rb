class User < ApplicationRecord
 has_secure_password
 has_many :ideas
 has_many :reviews

VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
validates :email, presence: true, uniqueness: true, format: VALID_EMAIL_REGEX

validates :first_name, :last_name, presence: true
end
