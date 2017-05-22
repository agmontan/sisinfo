class CreateAssistances < ActiveRecord::Migration[5.0]
  def change
    create_table :assistances do |t|
      t.references :user, foreign_key: true
       t.integer :hours_worked
      t.integer :permission
      t.integer :month
     

      t.timestamps
    end
  end
end
