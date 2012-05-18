class AddNeededFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :image, :string
    add_column :users, :access_token, :string
    add_column :users, :access_secret, :string
  end
end
