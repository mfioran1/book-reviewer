class BookCatalog < ApplicationRecord
  belongs_to :book
  belongs_to :catalog
end
