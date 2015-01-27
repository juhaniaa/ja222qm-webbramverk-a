class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :description
      t.string :apikey
      t.timestamps
    end
  end
end
