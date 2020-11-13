class Catalog < ApplicationRecord
  belongs_to :user

  has_many :book_catalogs
  has_many :books, through: :book_catalogs
end
