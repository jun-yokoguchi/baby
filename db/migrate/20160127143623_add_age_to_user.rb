class AddAgeToUser < ActiveRecord::Migration
  def change
    add_column :users, :age, :integer
    add_column :users, :nickname, :string
    add_column :users, :title, :string
    add_column :users, :profile, :string
    add_column :users, :homepage, :string
    add_column :users, :blog, :string
    add_column :users, :twitter, :string
    add_column :users, :facebook, :string
    add_column :users, :mixi, :string
  end
end
