class CreateSubscribers < ActiveRecord::Migration
  def change
    create_table :subscribers do |t|
      t.string :email
      t.boolean :activated
      t.string :activation_digest

      t.timestamps null: false
    end
  end
end
