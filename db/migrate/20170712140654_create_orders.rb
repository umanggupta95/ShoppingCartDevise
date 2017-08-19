class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
    	t.string :name
      t.string :email
      t.string :address
      t.string :status
      t.integer :user_id

      t.timestamps
    end
  end
end
