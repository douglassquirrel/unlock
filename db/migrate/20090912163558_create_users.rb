class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :passcode
      t.string :email
      t.string :telephone

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
