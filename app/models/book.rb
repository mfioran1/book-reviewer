class Book < ApplicationRecord
    has_many :reviews
    has_many :users, through: :reviews

    has_many :book_catalogs
    has_many :catalogs, through: :book_catalogs

    validates :title, presence: true, uniqueness: true 
    validates :author, presence: true

    scope :highest_ranked, -> {joins(:reviews).group("books.id").order("AVG(reviews.rating)  DESC").limit(10)}

end
