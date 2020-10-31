class Catalog < ApplicationRecord
  belongs_to :user

  has_many :books, through: :book_catalogs
end
