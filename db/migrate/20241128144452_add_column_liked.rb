class AddColumnLiked < ActiveRecord::Migration[7.1]
  def change
    add_column :likes, :is_liked, :boolean
  end
end
