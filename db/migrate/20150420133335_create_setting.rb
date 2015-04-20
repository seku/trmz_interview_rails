class CreateSetting < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string :query, null: false
      t.integer :run_at_hour, null: false
      t.integer :run_at_minute, null: false
      t.integer :limit, null: false
      t.timestamps
    end
  end
end
