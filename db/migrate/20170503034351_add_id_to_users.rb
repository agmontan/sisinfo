class AddIdToUsers < ActiveRecord::Migration[5.0]
  def change
    
    add_column :users, :position, :string
    add_column :users, :birthdate, :date
    add_column :users, :work, :string

  end
end
