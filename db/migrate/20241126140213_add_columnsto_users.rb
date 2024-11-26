class AddColumnstoUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :age, :integer, default: 0, null: false
    add_column :users, :friends_age, :integer, default: 0, null: false
    add_column :users, :friends_distance, :integer, default: 0, null: false
    add_column :users, :name, :string
    add_column :users, :language, :string
    add_column :users, :location, :string
    add_column :users, :genre, :string
    add_column :users, :friends_genre, :string
    add_column :users, :friends_language, :string
    add_column :users, :situation, :string
    add_column :users, :avatar, :string
    add_column :users, :photos, :string
    add_column :users, :mood, :string
    add_column :users, :vacation, :string
    add_column :users, :life_choice, :string
  end
end
