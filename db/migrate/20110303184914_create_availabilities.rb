class CreateAvailabilities < ActiveRecord::Migration
  def self.up
    create_table :availabilities do |t|
      t.text :json_data
      t.integer :business_account_id
      t.timestamps
    end
  end
  
  def self.down
    drop_table :availabilities
  end
end
