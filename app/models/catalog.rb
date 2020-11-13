class Catalog < ApplicationRecord
  belongs_to :user

  has_many :book_catalogs
  has_many :books, through: :book_catalogs

  validates :name, presence: true
  validates :name, uniqueness: { scope: :user, message: "Catalog name must be unique!" }
  validates :description, presence: true

end
