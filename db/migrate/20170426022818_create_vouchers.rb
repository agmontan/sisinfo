class CreateVouchers < ActiveRecord::Migration[5.0]
  def change
    create_table :vouchers do |t|
      t.references :user, foreign_key: true
      t.integer :salary
      t.text :description

      t.timestamps
    end
  end
end
