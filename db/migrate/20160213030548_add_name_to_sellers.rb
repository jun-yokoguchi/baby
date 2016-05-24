class AddNameToSellers < ActiveRecord::Migration
  def change
    add_column :sellers, :name, :string
    add_column :sellers, :pname, :string
    add_column :sellers, :gender, :string
    add_column :sellers, :address, :string
    add_column :sellers, :phone, :string
    add_column :sellers, :birthday, :string
    add_column :sellers, :postalcode, :string
  end
end
