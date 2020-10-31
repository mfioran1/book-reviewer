class Book < ApplicationRecord
    has_many :reviews
    has_many :users, through: :reviews

    has_many :book_catalogs
    has_many :catalogs, through: :book_catalogs
end
