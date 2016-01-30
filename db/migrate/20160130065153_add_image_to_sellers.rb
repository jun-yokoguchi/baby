class AddImageToSellers < ActiveRecord::Migration
  def change
    add_column :sellers, :image, :string
  end
end
