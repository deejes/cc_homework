class AddCategoryToPosts < ActiveRecord::Migration[5.1]
  def change
    add_reference :posts, :category, foreign_key: true, index: true
  end
end
