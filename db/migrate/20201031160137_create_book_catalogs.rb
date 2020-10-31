class CreateBookCatalogs < ActiveRecord::Migration[6.0]
  def change
    create_table :book_catalogs do |t|
      t.belongs_to :book, null: false, foreign_key: true
      t.belongs_to :catalog, null: false, foreign_key: true

      t.timestamps
    end
  end
end
