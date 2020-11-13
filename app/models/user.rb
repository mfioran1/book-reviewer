class User < ApplicationRecord
    has_secure_password
    has_many :reviews
    has_many :books, through: :reviews
    has_many :catalogs

    validates :username, presence: true, uniqueness: true
    validates :email, uniqueness: true
end
