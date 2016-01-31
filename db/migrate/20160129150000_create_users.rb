class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
#      t.string :email
#      t.string :password_digest

      t.integer :age
      t.string :nickname
      t.string :title
      t.string :profile
      t.string :homepage
      t.string :blog
      t.string :twitter
      t.string :facebook
      t.string :users, :mixi, :string


      t.timestamps null: false
#      t.index :email, unique: true
    end
  end
end
