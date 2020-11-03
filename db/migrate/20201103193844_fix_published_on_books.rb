class FixPublishedOnBooks < ActiveRecord::Migration[6.0]
  def change
    rename_column :books, :published, :year_published
  end
end
