class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :headquarters
      t.string :url
      t.string :email

      t.timestamps null: false
    end
  end
end
