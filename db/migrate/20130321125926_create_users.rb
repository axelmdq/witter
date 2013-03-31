class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :name
      t.string :surname
      t.string :password
      t.string :about_me

      t.timestamps
    end
  end
end
