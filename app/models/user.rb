class User < ActiveRecord::Base
    validates :email, :password, presence: true
    has_secure_password

    has_many :wishlists
end